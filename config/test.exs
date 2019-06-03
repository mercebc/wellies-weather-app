use Mix.Config

# Configure your database
config :wellies, Wellies.Repo,
  username: "postgres",
  password: "postgres",
  database: "wellies_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :wellies, WelliesWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :wellies, httpClient: WelliesWeb.HTTPClientStub
config :wellies, api_key: "1234"
