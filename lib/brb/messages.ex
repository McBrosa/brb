defmodule Brb.Messages do
  import Ecto.Query, warn: false
  alias Brb.Repo
  alias Brb.Messages.Message

  def create_message(attrs \\ %{}) do
    %Message{}
    |> Message.changeset(attrs)
    |> Repo.insert()
  end

  def list_messages do
    Repo.all(Message)
  end

  def get_message!(message_id) do
    Repo.get!(Message, message_id)
  end
end
