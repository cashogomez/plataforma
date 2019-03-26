# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :plataforma,
  ecto_repos: [Plataforma.Repo]

# Configures the endpoint
config :plataforma, PlataformaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bpHcR9+Z/+By4CF4KXnLfEqJUD6N0/i1iZGa6vzmS3Wx/b3X1ah995KcPjUUWDiM",
  render_errors: [view: PlataformaWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Plataforma.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
