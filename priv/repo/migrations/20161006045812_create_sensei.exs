defmodule Boilerplate.Repo.Migrations.CreateSensei do
  use Ecto.Migration

  def change do
    create table(:senseis) do
      add :first_name, :string
      add :last_name, :string
      add :photo_url, :string
      add :bio, :text

      timestamps()
    end

  end
end
