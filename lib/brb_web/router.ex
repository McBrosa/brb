defmodule BrbWeb.Router do
  use BrbWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", BrbWeb do
    pipe_through(:api)

    post("/users", UserController, :create)
    get("/users", UserController, :index)
    get("/users/:id", UserController, :show)

    post("/messages", MessageController, :create)
    get("/messages", MessageController, :index)
    get("/messages/:message_id", MessageController, :show)
    get("/messages/by_phone_number/:phone_number", UserController, :get_messages_by_phone_number)
  end
end
