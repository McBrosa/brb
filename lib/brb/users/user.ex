defmodule Brb.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:user_id, :binary_id, autogenerate: true}
  @derive {Jason.Encoder, only: [:user_id, :name, :email, :phone_number, :inserted_at, :updated_at]}
  schema "users" do
    field :name, :string
    field :email, :string
    field :phone_number, :string
    field :hashed_password, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :phone_number, :hashed_password])
    |> validate_required([:name, :email, :phone_number, :hashed_password])
    |> unique_constraint(:email)
    |> unique_constraint(:phone_number)
  end
end
