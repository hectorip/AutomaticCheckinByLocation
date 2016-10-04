defmodule Boilerplate.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :username, :string
      add :email, :string
      add :password_hash, :string
      add :status, :integer

      timestamps()
    end

  end
end
