defmodule Boilerplate.Venue do
  use Boilerplate.Web, :model

  schema "venues" do
    field :name, :string
    field :lat, :float
    field :long, :float
    field :address, :string
    field :description, :string
    field :photo_url, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :lat, :long, :address, :description, :photo_url])
    |> validate_required([:name, :lat, :long, :address, :description, :photo_url])
  end
end
