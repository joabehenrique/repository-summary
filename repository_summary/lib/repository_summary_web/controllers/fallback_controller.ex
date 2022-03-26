defmodule RepositorySummaryWeb.FallbackController do
  use RepositorySummaryWeb, :controller
  alias RepositorySummary.Error
  alias RepositorySummaryWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
