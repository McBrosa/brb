defmodule BrbWeb.UserSocket do
  use Phoenix.Socket

  channel "messages:lobby", BrbWeb.MessageChannel

  def connect(%{"phone_number" => phone_number}, socket, _connect_info) do
    {:ok, assign(socket, :phone_number, phone_number)}
  end

  def id(_socket), do: nil
end
