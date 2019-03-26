defmodule PlataformaWeb.PageControllerTest do
  use PlataformaWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Jugadores"
  end
end
