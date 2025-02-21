defmodule Brb.Repo do
  use Ecto.Repo,
    otp_app: :brb,
    adapter: Ecto.Adapters.Postgres
end
