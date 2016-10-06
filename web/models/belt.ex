defmodule Boilerplate.Belt do
  use Boilerplate.Web, :model

  schema "belts" do
    field :name, :string
    field :logo, :string
    field :description, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :logo, :description])
    |> validate_required([:name, :logo, :description])
  end
end
