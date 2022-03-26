defmodule RepositorySummary.Repo do
  use Ecto.Repo,
    otp_app: :repository_summary,
    adapter: Ecto.Adapters.Postgres
end
