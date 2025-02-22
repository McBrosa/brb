defmodule Brb.Messages do
  import Ecto.Query, warn: false
  alias Brb.Repo
  alias Brb.Messages.Message
  alias Brb.Users.User

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

  def get_messages_by_phone_number(phone_number) do
    query = from m in Message,
            join: s in User, on: m.sender_id == s.user_id,
            join: r in User, on: m.receiver_id == r.user_id,
            where: s.phone_number == ^phone_number or r.phone_number == ^phone_number,
            select: m

    Repo.all(query)
  end
end
