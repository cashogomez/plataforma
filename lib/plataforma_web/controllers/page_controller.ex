defmodule PlataformaWeb.PageController do
  use PlataformaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
