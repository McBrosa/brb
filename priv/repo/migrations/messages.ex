defmodule Brb.Messages.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :message_id, :uuid, default: fragment("gen_random_uuid()"), primary_key: true
    field :message, :string
    field :reactions, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:message, :reactions])
    |> validate_required([:message])
  end
end
