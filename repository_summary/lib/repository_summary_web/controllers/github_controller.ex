defmodule RepositorySummaryWeb.GithubController do
  use RepositorySummaryWeb, :controller

  alias RepositorySummaryWeb.FallbackController

  action_fallback(FallbackController)

  def find_repositorys(conn, %{"name" => name} = _params) do
    with {:ok, repositorys} <-
           RepositorySummary.find_repositorys(name) do
      new_token = conn.private[:refresh_token]

      conn
      |> put_status(:ok)
      |> render("find_repositorys.json", %{repositorys: repositorys, token: new_token})
    end
  end
end
