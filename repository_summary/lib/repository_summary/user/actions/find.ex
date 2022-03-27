defmodule RepositorySummary.User.Find do
  alias RepositorySummary.{Error, Repo}
  alias RepositorySummary.User

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> {:ok, user}
    end
  end
end
