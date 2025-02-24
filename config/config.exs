import Config

config :brb, BrbWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: BrbWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Brb.PubSub,
  live_view: [signing_salt: "YOUR_SIGNING_SALT"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"
