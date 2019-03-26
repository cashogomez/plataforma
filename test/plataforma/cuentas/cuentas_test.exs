defmodule Plataforma.CuentasTest do
  use Plataforma.DataCase

  alias Plataforma.Cuentas

  describe "jugadores" do
    alias Plataforma.Cuentas.Jugador

    @valid_attrs %{puntos: 42, usuario: "some usuario"}
    @update_attrs %{puntos: 43, usuario: "some updated usuario"}
    @invalid_attrs %{puntos: nil, usuario: nil}

    def jugador_fixture(attrs \\ %{}) do
      {:ok, jugador} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Cuentas.create_jugador()

      jugador
    end

    test "list_jugadores/0 returns all jugadores" do
      jugador = jugador_fixture()
      assert Cuentas.list_jugadores() == [jugador]
    end

    test "get_jugador!/1 returns the jugador with given id" do
      jugador = jugador_fixture()
      assert Cuentas.get_jugador!(jugador.id) == jugador
    end

    test "create_jugador/1 with valid data creates a jugador" do
      assert {:ok, %Jugador{} = jugador} = Cuentas.create_jugador(@valid_attrs)
      assert jugador.puntos == 42
      assert jugador.usuario == "some usuario"
    end

    test "create_jugador/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cuentas.create_jugador(@invalid_attrs)
    end

    test "update_jugador/2 with valid data updates the jugador" do
      jugador = jugador_fixture()
      assert {:ok, %Jugador{} = jugador} = Cuentas.update_jugador(jugador, @update_attrs)
      assert jugador.puntos == 43
      assert jugador.usuario == "some updated usuario"
    end

    test "update_jugador/2 with invalid data returns error changeset" do
      jugador = jugador_fixture()
      assert {:error, %Ecto.Changeset{}} = Cuentas.update_jugador(jugador, @invalid_attrs)
      assert jugador == Cuentas.get_jugador!(jugador.id)
    end

    test "delete_jugador/1 deletes the jugador" do
      jugador = jugador_fixture()
      assert {:ok, %Jugador{}} = Cuentas.delete_jugador(jugador)
      assert_raise Ecto.NoResultsError, fn -> Cuentas.get_jugador!(jugador.id) end
    end

    test "change_jugador/1 returns a jugador changeset" do
      jugador = jugador_fixture()
      assert %Ecto.Changeset{} = Cuentas.change_jugador(jugador)
    end
  end
end
