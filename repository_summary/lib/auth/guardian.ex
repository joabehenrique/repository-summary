defmodule RepositorySummaryWeb.Auth.Guardian do
  use Guardian, otp_app: :repository_summary

  import Plug.Conn

  alias RepositorySummary.{Error, User}
  alias RepositorySummary.User.Find, as: UserFind

  @ttl_time {1, :minute}

  def subject_for_token(%User{id: id}, _claims), do: {:ok, id}

  def resource_from_claims(%{"sub" => id}), do: UserFind.call(id)

  def authenticate(%{"id" => user_id, "password" => password}) do
    with {:ok, %User{password_hash: hash} = user} <- UserFind.call(user_id),
         true <- Pbkdf2.verify_pass(password, hash),
         {:ok, token, _claims} <- encode_and_sign(user, %{}, ttl: @ttl_time) do
      {:ok, token}
    else
      false -> {:error, Error.build(:unauthorized, "Invalid Credentials!")}
      error -> error
    end
  end

  def refresh_token(old_token) do
    case RepositorySummaryWeb.Auth.Guardian.refresh(old_token, ttl: @ttl_time) do
      {:ok, _old_stuff, {new_token, _new_claims}} -> {:ok, new_token}
      error -> error
    end
  end

  def authenticate(_), do: {:error, Error.build(:bad_request, "Invalid or missing params!")}
end
