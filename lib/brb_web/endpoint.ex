defmodule BrbWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :brb

  socket "/socket", BrbWeb.UserSocket,
    websocket: true,
    longpoll: false

  # Serve at "/" the static files from "priv/static" directory.
  plug(Plug.Static,
    at: "/",
    from: :brb,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)
  )

  # Code reloading can be explicitly enabled under the :code_reloader configuration
  # of your endpoint.
  if code_reloading? do
    plug(Phoenix.CodeReloader)
  end

  plug(Plug.RequestId)
  plug(Plug.Telemetry, event_prefix: [:phoenix, :endpoint])

  plug(Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()
  )

  plug(Plug.MethodOverride)
  plug(Plug.Head)
  plug(Plug.Session, store: :cookie, key: "_brb_key", signing_salt: "YOUR_SIGNING_SALT")

  plug(BrbWeb.Router)
end
