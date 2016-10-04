defmodule Boilerplate.User do
  use Boilerplate.Web, :model

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :username, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :status, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ :empty) do
    struct
    |> cast(params, [:first_name, :last_name, :username, :email, :password, :status])
    |> validate_required([:username, :email, :password])
  end

  def registration_changeset(struct, params) do
    struct
    |> changeset(params)
    |> validate_length(:password, min: 6)
    |> put_hashed_pass
  end

  def put_hashed_pass(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end
end
