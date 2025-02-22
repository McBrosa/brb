defmodule Brb.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :message_id, :uuid, default: fragment("gen_random_uuid()"), primary_key: true
      add :message, :text
      add :reactions, {:array, :string}

      timestamps()
    end
  end
end
