defmodule RepositorySummaryWeb.GithubView do
  use RepositorySummaryWeb, :view

  def render("find_repositorys.json", %{repositorys: repositorys, token: new_token}) do
    %{
      message: "Repositorys found",
      repositorys: repositorys,
      token: new_token
    }
  end
end
