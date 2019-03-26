defmodule PlataformaWeb.JugadorController do
  use PlataformaWeb, :controller

  alias Plataforma.Cuentas
  alias Plataforma.Cuentas.Jugador

  def index(conn, _params) do
    jugadores = Cuentas.list_jugadores()
    render(conn, "index.html", jugadores: jugadores)
  end

  def new(conn, _params) do
    changeset = Cuentas.change_jugador(%Jugador{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"jugador" => jugador_params}) do
    case Cuentas.create_jugador(jugador_params) do
      {:ok, jugador} ->
        conn
        |> put_flash(:info, "Jugador created successfully.")
        |> redirect(to: Routes.jugador_path(conn, :show, jugador))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    jugador = Cuentas.get_jugador!(id)
    render(conn, "show.html", jugador: jugador)
  end

  def edit(conn, %{"id" => id}) do
    jugador = Cuentas.get_jugador!(id)
    changeset = Cuentas.change_jugador(jugador)
    render(conn, "edit.html", jugador: jugador, changeset: changeset)
  end

  def update(conn, %{"id" => id, "jugador" => jugador_params}) do
    jugador = Cuentas.get_jugador!(id)

    case Cuentas.update_jugador(jugador, jugador_params) do
      {:ok, jugador} ->
        conn
        |> put_flash(:info, "Jugador updated successfully.")
        |> redirect(to: Routes.jugador_path(conn, :show, jugador))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", jugador: jugador, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    jugador = Cuentas.get_jugador!(id)
    {:ok, _jugador} = Cuentas.delete_jugador(jugador)

    conn
    |> put_flash(:info, "Jugador deleted successfully.")
    |> redirect(to: Routes.jugador_path(conn, :index))
  end
end
