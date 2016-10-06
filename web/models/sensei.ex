defmodule Boilerplate.Sensei do
  use Boilerplate.Web, :model

  schema "senseis" do
    field :first_name, :string
    field :last_name, :string
    field :photo_url, :string
    field :bio, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:first_name, :last_name, :photo_url, :bio])
    |> validate_required([:first_name, :last_name, :photo_url, :bio])
  end
end
