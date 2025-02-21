defmodule BrbWeb.PageController do
  use BrbWeb, :controller

  def index(conn, _params) do
    conn
    |> assign(:page_title, "Home")
    |> render("index.html")
  end
end
