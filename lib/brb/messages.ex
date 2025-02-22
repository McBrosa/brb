defmodule Brb.Messages do
  import Ecto.Query, warn: false
  alias Brb.Repo
  alias Brb.Messages.Message

  def create_message(attrs \\ %{}) do
    %Message{}
    |> Message.changeset(attrs)
    |> Repo.insert()
  end
end
