defmodule BrbWeb.MessageController do
  use BrbWeb, :controller

  alias Brb.Messages
  alias Brb.Messages.Message
  alias Brb.Users

  def create(conn, %{"message" => message, "reactions" => reactions, "sender_phone_number" => sender_phone_number, "receiver_phone_number" => receiver_phone_number}) do
    with {:ok, sender} <- Users.get_user_by_phone_number(sender_phone_number),
         {:ok, receiver} <- Users.get_user_by_phone_number(receiver_phone_number) do
      message_params = %{"message" => message, "reactions" => reactions, "sender_id" => sender.user_id, "receiver_id" => receiver.user_id}
      case Messages.create_message(message_params) do
        {:ok, %Message{} = message} ->
          conn
          |> put_status(:created)
          |> json(%{message: message})

        {:error, %Ecto.Changeset{} = changeset} ->
          conn
          |> put_status(:unprocessable_entity)
          |> json(%{errors: changeset})
      end
    else
      _ -> conn |> put_status(:not_found) |> json(%{error: "Sender or receiver not found"})
    end
  end

  def index(conn, _params) do
    messages = Messages.list_messages()
    json(conn, %{messages: messages})
  end

  def show(conn, %{"message_id" => message_id}) do
    message = Messages.get_message!(message_id)
    json(conn, %{message: message})
  end

  def get_by_phone_number(conn, %{"phone_number" => phone_number}) do
    messages = Messages.get_messages_by_phone_number(phone_number)
    json(conn, %{messages: messages})
  end
end
