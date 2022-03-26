defmodule RepositorySummaryWeb.GithubView do
  use RepositorySummaryWeb, :view

  def render("find_repositorys.json", %{repositorys: repositorys}) do
    %{
      message: "Repositorys found",
      repositorys: repositorys
    }
  end
end
