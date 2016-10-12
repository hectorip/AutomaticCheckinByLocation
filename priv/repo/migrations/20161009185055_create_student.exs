defmodule Boilerplate.Repo.Migrations.CreateStudent do
  use Ecto.Migration

  def change do
    create table(:students) do
      add :first_name, :string
      add :first_last_name, :string
      add :second_last_name, :string
      add :email, :string
      add :phone, :string
      add :photo_url, :string
      add :bio, :string
      add :current_group, references(:groups, on_delete: :nothing)

      timestamps()
    end
    create index(:students, [:current_group])

  end
end
