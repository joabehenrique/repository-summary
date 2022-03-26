defmodule RepositorySummary do
  alias RepositorySummary.FindRepository, as: FindRepository

  defdelegate find_repositorys(params), to: FindRepository, as: :call
end
