defmodule Plataforma.Repo.Migrations.CreateJugadores do
  use Ecto.Migration

  def change do
    create table(:jugadores) do
      add :usuario, :string
      add :puntos, :integer

      timestamps()
    end

  end
end
