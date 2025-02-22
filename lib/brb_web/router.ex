defmodule BrbWeb.Router do
  use BrbWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", BrbWeb do
    pipe_through(:api)

    post("/messages", MessageController, :create)
    get("/messages", MessageController, :index)
    get("/messages/:message_id", MessageController, :show)
  end
end
