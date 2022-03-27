defmodule RepositorySummaryWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :repository_summary

  plug(Guardian.Plug.VerifyHeader)
  plug(Guardian.Plug.EnsureAuthenticated)
  plug(Guardian.Plug.LoadResource)
end
