defmodule Boilerplate.Batch do
  use Boilerplate.Web, :model

  schema "batches" do
    field :name, :string
    field :number, :integer
    field :photo_url, :string
    field :logo_url, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :number, :photo_url, :logo_url])
    |> validate_required([:name, :number, :photo_url, :logo_url])
  end
end
