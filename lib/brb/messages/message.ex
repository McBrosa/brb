defmodule Brb.Messages.Message do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :message, :reactions, :inserted_at, :updated_at]}
  schema "messages" do
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
