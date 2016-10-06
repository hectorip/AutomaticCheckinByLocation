defmodule Boilerplate.Repo.Migrations.CreateBelt do
  use Ecto.Migration

  def change do
    create table(:belts) do
      add :name, :string
      add :logo, :string
      add :description, :string

      timestamps()
    end

  end
end
