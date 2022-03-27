defmodule RepositorySummary do
  alias RepositorySummary.FindRepository, as: FindRepository
  alias RepositorySummary.User.Create, as: CreateUser

  defdelegate find_repositorys(params), to: FindRepository, as: :call
  defdelegate create_user(params), to: CreateUser, as: :call
end
