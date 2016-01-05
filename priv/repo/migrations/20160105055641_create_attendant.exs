defmodule AutomaticAttendance.Repo.Migrations.CreateAttendant do
  use Ecto.Migration

  def change do
    create table(:attendants) do
      add :name, :string
      add :image, :string
      add :key, :string
      add :extra_data, :string
      add :active, :boolean, default: false

      timestamps
    end

  end
end
