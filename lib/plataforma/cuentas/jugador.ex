defmodule Plataforma.Cuentas.Jugador do
  use Ecto.Schema
  import Ecto.Changeset

  schema "jugadores" do
    field :puntos, :integer
    field :usuario, :string

    timestamps()
  end

  @doc false
  def changeset(jugador, attrs) do
    jugador
    |> cast(attrs, [:usuario, :puntos])
    |> validate_required([:usuario, :puntos])
  end
end
