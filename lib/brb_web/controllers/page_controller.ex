defmodule BrbWeb.PageController do
  use BrbWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
