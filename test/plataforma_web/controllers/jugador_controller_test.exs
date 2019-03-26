defmodule PlataformaWeb.JugadorControllerTest do
  use PlataformaWeb.ConnCase

  alias Plataforma.Cuentas

  @create_attrs %{puntos: 42, usuario: "some usuario"}
  @update_attrs %{puntos: 43, usuario: "some updated usuario"}
  @invalid_attrs %{puntos: nil, usuario: nil}

  def fixture(:jugador) do
    {:ok, jugador} = Cuentas.create_jugador(@create_attrs)
    jugador
  end

  describe "index" do
    test "lists all jugadores", %{conn: conn} do
      conn = get(conn, Routes.jugador_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Jugadores"
    end
  end

  describe "new jugador" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.jugador_path(conn, :new))
      assert html_response(conn, 200) =~ "New Jugador"
    end
  end

  describe "create jugador" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.jugador_path(conn, :create), jugador: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.jugador_path(conn, :show, id)

      conn = get(conn, Routes.jugador_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Jugador"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.jugador_path(conn, :create), jugador: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Jugador"
    end
  end

  describe "edit jugador" do
    setup [:create_jugador]

    test "renders form for editing chosen jugador", %{conn: conn, jugador: jugador} do
      conn = get(conn, Routes.jugador_path(conn, :edit, jugador))
      assert html_response(conn, 200) =~ "Edit Jugador"
    end
  end

  describe "update jugador" do
    setup [:create_jugador]

    test "redirects when data is valid", %{conn: conn, jugador: jugador} do
      conn = put(conn, Routes.jugador_path(conn, :update, jugador), jugador: @update_attrs)
      assert redirected_to(conn) == Routes.jugador_path(conn, :show, jugador)

      conn = get(conn, Routes.jugador_path(conn, :show, jugador))
      assert html_response(conn, 200) =~ "some updated usuario"
    end

    test "renders errors when data is invalid", %{conn: conn, jugador: jugador} do
      conn = put(conn, Routes.jugador_path(conn, :update, jugador), jugador: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Jugador"
    end
  end

  describe "delete jugador" do
    setup [:create_jugador]

    test "deletes chosen jugador", %{conn: conn, jugador: jugador} do
      conn = delete(conn, Routes.jugador_path(conn, :delete, jugador))
      assert redirected_to(conn) == Routes.jugador_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.jugador_path(conn, :show, jugador))
      end
    end
  end

  defp create_jugador(_) do
    jugador = fixture(:jugador)
    {:ok, jugador: jugador}
  end
end
