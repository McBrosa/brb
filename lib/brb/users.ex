defmodule Brb.Users do
  import Ecto.Query, warn: false
  alias Brb.Repo
  alias Brb.Users.User

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def list_users do
    Repo.all(User)
  end

  def get_user!(user_id) do
    Repo.get!(User, user_id)
  end

  def get_user(user_id) do
    Repo.get(User, user_id)
  end

  def get_user_by_phone_number(phone_number) do
    case Repo.get_by(User, phone_number: phone_number) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end
