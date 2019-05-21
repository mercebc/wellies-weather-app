# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :wellies,
       ecto_repos: [Wellies.Repo]

# Configures the endpoint
config :wellies, WelliesWeb.Endpoint,
       url: [host: "localhost"],
       secret_key_base: "XpAPRCSOIcEEYqmhFc2/QCX/LdPehQxkOb5Sa1L2+DFeTFUz3dL18A+FRQYnzkCV",
       render_errors: [view: WelliesWeb.ErrorView, accepts: ~w(html json)],
       pubsub: [name: Wellies.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
       format: "$time $metadata[$level] $message\n",
       metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason


if Mix.env() == :test do
  config :wellies, httpClient: WelliesWeb.HTTPClientStub
else
  config :wellies, httpClient: WelliesWeb.HTTPClient
end
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"