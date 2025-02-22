defmodule Brb.Messages.Message do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:message_id, :binary_id, autogenerate: true}
  @derive {Jason.Encoder, only: [:message_id, :message, :reactions, :inserted_at, :updated_at, :sender_id, :receiver_id]}
  schema "messages" do
    field :message, :string
    field :reactions, {:array, :string}

    belongs_to :sender, Brb.Users.User, type: :binary_id, foreign_key: :sender_id
    belongs_to :receiver, Brb.Users.User, type: :binary_id, foreign_key: :receiver_id

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:message, :reactions, :sender_id, :receiver_id])
    |> validate_required([:message, :sender_id, :receiver_id])
  end
end
