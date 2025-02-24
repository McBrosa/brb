defmodule BrbWeb.UserController do
  use BrbWeb, :controller

  alias Brb.Users
  alias Brb.Users.User
  alias Brb.Messages

  def create(conn, %{"user" => user_params}) do
    case Users.create_user(user_params) do
      {:ok, %User{} = user} ->
        conn
        |> put_status(:created)
        |> json(%{user: user})

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{errors: changeset})
    end
  end

  def index(conn, _params) do
    users = Users.list_users()
    json(conn, %{users: users})
  end

  def show(conn, %{"id" => id}) do
    case Users.get_user(id) do
      nil ->
        json(conn, %{})

      user ->
        json(conn, %{user: user})
    end
  end

  def get_messages_by_phone_number(conn, %{"phone_number" => phone_number}) do
    messages = Messages.get_messages_by_phone_number(phone_number)
    json(conn, %{messages: messages})
  end

  def get_messages_between_phone_numbers(conn, %{"phone_number1" => phone_number1, "phone_number2" => phone_number2}) do
    messages = Messages.get_messages_between_phone_numbers(phone_number1, phone_number2)
    json(conn, %{messages: messages})
  end
end
