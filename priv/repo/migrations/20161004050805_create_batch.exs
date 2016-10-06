defmodule Boilerplate.Repo.Migrations.CreateBatch do
  use Ecto.Migration

  def change do
    create table(:batches) do
      add :name, :string
      add :number, :integer
      add :photo_url, :string
      add :logo_url, :string

      timestamps()
    end

  end
end
