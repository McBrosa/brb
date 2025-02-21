import Config

# General application configuration
config :brb,
  ecto_repos: [Brb.Repo]

# Configures the endpoint
config :brb, BrbWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "YOUR_SECRET_KEY_BASE",
  render_errors: [view: BrbWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Brb.PubSub,
  live_view: [signing_salt: "YOUR_SIGNING_SALT"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
