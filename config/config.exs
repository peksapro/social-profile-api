# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :profile_api,
  ecto_repos: [ProfileApi.Repo]

# Configures the endpoint
config :profile_api, ProfileApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5uIjT8OY09WSadMwfR7Lytz5usxeJ468zTBWDK7As6cVnlMmuKljdtiloh334mCr",
  render_errors: [view: ProfileApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: ProfileApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
