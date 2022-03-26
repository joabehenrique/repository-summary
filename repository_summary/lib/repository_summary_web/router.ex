defmodule RepositorySummaryWeb.Router do
  use RepositorySummaryWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api/v1/github", RepositorySummaryWeb do
    pipe_through(:api)

    get("/user/:name", GithubController, :find_repositorys)
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through([:fetch_session, :protect_from_forgery])
      live_dashboard("/dashboard", metrics: RepositorySummaryWeb.Telemetry)
    end
  end
end
