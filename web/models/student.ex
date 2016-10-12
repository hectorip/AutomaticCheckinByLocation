defmodule Boilerplate.Student do
  use Boilerplate.Web, :model

  schema "students" do
    field :first_name, :string
    field :first_last_name, :string
    field :second_last_name, :string
    field :email, :string
    field :phone, :string
    field :photo_url, :string
    field :bio, :string
    belongs_to :current_group, Boilerplate.CurrentGroup

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:first_name, :first_last_name, :second_last_name, :email, :phone, :photo_url, :bio])
    |> validate_required([:first_name, :first_last_name, :second_last_name, :email, :phone, :photo_url, :bio])
  end
end
