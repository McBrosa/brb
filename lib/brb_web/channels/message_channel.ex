defmodule BrbWeb.MessageChannel do
  use Phoenix.Channel
  require Logger

  alias Brb.Messages
  alias Brb.Messages.Message
  alias Brb.Users

  def join("messages:lobby", _message, socket) do
    phone_number = socket.assigns.phone_number
    case Users.get_user_by_phone_number(phone_number) do
      {:ok, user} ->
        Logger.info("User #{user.name} (Phone Number: #{phone_number}) joined the messages:lobby channel")
        {:ok, socket}

      {:error, _reason} ->
        Logger.error("User with phone number #{phone_number} not found")
        {:error, %{reason: "User not found"}}
    end
  end

  def handle_in("new_message", %{"message" => message, "reactions" => reactions, "sender_phone_number" => sender_phone_number, "receiver_phone_number" => receiver_phone_number}, socket) do
    Logger.info("Received new_message event with payload: #{inspect(%{message: message, reactions: reactions, sender_phone_number: sender_phone_number, receiver_phone_number: receiver_phone_number})}")

    with {:ok, sender} <- Users.get_user_by_phone_number(sender_phone_number),
         {:ok, receiver} <- Users.get_user_by_phone_number(receiver_phone_number) do
      message_params = %{"message" => message, "reactions" => reactions, "sender_id" => sender.user_id, "receiver_id" => receiver.user_id}
      case Messages.create_message(message_params) do
        {:ok, %Message{} = message} ->
          Logger.info("Message created successfully: #{inspect(message)}")
          broadcast!(socket, "new_message", %{message: message})
          {:noreply, socket}

        {:error, %Ecto.Changeset{} = changeset} ->
          Logger.error("Failed to create message: #{inspect(changeset)}")
          {:reply, {:error, %{errors: changeset}}, socket}
      end
    else
      _ ->
        Logger.error("Sender or receiver not found")
        {:reply, {:error, %{error: "Sender or receiver not found"}}, socket}
    end
  end
end
