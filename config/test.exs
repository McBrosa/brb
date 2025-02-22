use Mix.Config

config :brb, Brb.Repo,
  username: System.get_env("USER") || System.get_env("USERNAME"),
  password: "",
  database: "brb_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  http: [port: 4002]

config :brb, ecto_repos: [Brb.Repo]

config :logger, level: :warn

config :phoenix, :json_library, Jason
