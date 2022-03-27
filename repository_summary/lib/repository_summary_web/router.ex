defmodule RepositorySummaryWeb.Router do
  use RepositorySummaryWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  pipeline :auth do
    plug(RepositorySummaryWeb.Auth.Pipeline)
    plug(RepositorySummaryWeb.Auth.RefreshToken)
  end

  scope "/api/v1/github", RepositorySummaryWeb do
    pipe_through([:api, :auth])

    get("/user/:name", GithubController, :find_repositorys)
  end

  scope "/api/v1/github", RepositorySummaryWeb do
    pipe_through(:api)

    post("/user/signin", UserController, :sign_in)
    post("/user/signup", UserController, :create)
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through([:fetch_session, :protect_from_forgery])
      live_dashboard("/dashboard", metrics: RepositorySummaryWeb.Telemetry)
    end
  end
end
