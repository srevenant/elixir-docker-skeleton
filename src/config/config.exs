# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :vibes,
  ecto_repos: [Vibes.Repo]

# Configures the endpoint
config :vibes, VibesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "iLBk8Y2jik9iec4YbhP9E3cKz3nOc1PHZq0L99mQI96RFxzH6sIGcGHaUTKQoomz",
  render_errors: [view: VibesWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Vibes.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
