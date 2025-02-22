defmodule Brb do
  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Brb.Repo,
      # Start the Telemetry supervisor
      Brb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Brb.PubSub},
      # Start the Endpoint (http/https)
      BrbWeb.Endpoint
      # Start a worker by calling: Brb.Worker.start_link(arg)
      # {Brb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Brb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    BrbWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
