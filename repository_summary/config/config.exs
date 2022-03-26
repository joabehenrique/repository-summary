# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :repository_summary,
  ecto_repos: [RepositorySummary.Repo]

# Configures the endpoint
config :repository_summary, RepositorySummaryWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UieaHkeSM7SyVQarOeh6xK1SejrlQtE/Vnjke+qrGO5XBO3IgQI6HHjNXJQqOsNQ",
  render_errors: [view: RepositorySummaryWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: RepositorySummary.PubSub,
  live_view: [signing_salt: "zy+pn/M0"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
