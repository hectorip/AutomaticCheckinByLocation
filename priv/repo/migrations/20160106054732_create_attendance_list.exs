defmodule AutomaticAttendance.Repo.Migrations.CreateAttendanceList do
  use Ecto.Migration

  def change do
    create table(:attendancelists) do
      add :name, :string
      add :place, :string
      add :description, :string
      add :attendant_count, :integer
      add :start_date, :date
      add :end_date, :date

      timestamps
    end

  end
end
