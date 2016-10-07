defmodule Boilerplate.Repo.Migrations.CreateVenue do
  use Ecto.Migration

  def change do
    create table(:venues) do
      add :name, :string
      add :lat, :float
      add :long, :float
      add :address, :string
      add :description, :string
      add :photo_url, :string

      timestamps()
    end

  end
end
