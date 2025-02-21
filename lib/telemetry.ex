defmodule Brb.Telemetry do
  use Supervisor

  def start_link(_arg) do
    Supervisor.start_link(__MODULE__, [])
  end

  @impl true
  def init(_arg) do
    children = [
      # Add telemetry children here
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
