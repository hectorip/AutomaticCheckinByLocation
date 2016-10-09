defmodule Boilerplate.Repo.Migrations.CreateGroup do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :photo_url, :string
      add :belt_id, references(:belts, on_delete: :nothing)
      add :batch_id, references(:batches, on_delete: :nothing)
      add :master_sensei_id, references(:senseis, on_delete: :nothing)

      timestamps()
    end
    create index(:groups, [:belt_id])
    create index(:groups, [:batch_id])
    create index(:groups, [:master_sensei_id])

  end
end
