use Mix.Config

config :brb, Brb.Endpoint,
  http: [port: System.get_env("PORT") || 4000],
  secret_key_base: System.get_env("SECRET_KEY_BASE") || "your_secret_key_base",
  server: true

config :logger, level: :info

config :brb, Brb.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")
