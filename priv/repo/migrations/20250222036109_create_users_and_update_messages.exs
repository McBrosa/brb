defmodule Brb.Repo.Migrations.CreateUsersAndUpdateMessages do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :user_id, :binary_id, primary_key: true, default: fragment("gen_random_uuid()")
      add :name, :string
      add :email, :string
      add :phone_number, :string
      add :hashed_password, :string

      timestamps()
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:phone_number])

    alter table(:messages) do
      add :sender_id, references(:users, column: :user_id, type: :binary_id, on_delete: :nothing)
      add :receiver_id, references(:users, column: :user_id, type: :binary_id, on_delete: :nothing)
    end

    create index(:messages, [:sender_id])
    create index(:messages, [:receiver_id])
  end
end
