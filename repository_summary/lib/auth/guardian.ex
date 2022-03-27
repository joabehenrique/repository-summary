defmodule RepositorySummaryWeb.Auth.Guardian do
  use Guardian, otp_app: :repository_summary

  alias RepositorySummary.{Error, User}
  alias RepositorySummary.User.Find, as: UserFind

  def subject_for_token(%User{id: id}, _claims), do: {:ok, id}

  def resource_from_claims(%{"sub" => id}), do: UserFind.call(id)

  def authenticate(%{"id" => user_id, "password" => password}) do
    with {:ok, %User{password_hash: hash} = user} <- UserFind.call(user_id),
         true <- Pbkdf2.verify_pass(password, hash),
         {:ok, token, _claims} <- encode_and_sign(user) do
      {:ok, token}
    else
      false -> {:error, Error.build(:unauthorized, "Invalid Credentials!")}
      error -> error
    end
  end

  def authenticate(_), do: {:error, Error.build(:bad_request, "Invalid or missing params!")}
end
