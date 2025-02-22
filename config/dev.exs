import Config

config :brb, BrbWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: []

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :brb, Brb.Repo,
  username: System.get_env("USER") || System.get_env("USERNAME"),
  password: "",
  database: "brb_dev",
  hostname: "localhost",
  pool_size: 10
