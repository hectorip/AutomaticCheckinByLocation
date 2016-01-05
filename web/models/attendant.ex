defmodule AutomaticAttendance.Attendant do
  use AutomaticAttendance.Web, :model

  schema "attendants" do
    field :name, :string
    field :image, :string
    field :key, :string
    field :extra_data, :string
    field :active, :boolean, default: false

    timestamps
  end

  @required_fields ~w(name image key extra_data active)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
