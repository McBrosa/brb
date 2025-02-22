defmodule BrbWeb.MessageController do
  use BrbWeb, :controller

  alias Brb.Messages
  alias Brb.Messages.Message

  def create(conn, %{"message" => message, "reactions" => reactions}) do
    message_params = %{"message" => message, "reactions" => reactions}
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
  end
end
