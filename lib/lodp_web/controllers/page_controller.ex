defmodule LodpWeb.PageController do
  use LodpWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
