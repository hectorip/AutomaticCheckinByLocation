defmodule Boilerplate.Group do
  use Boilerplate.Web, :model

  schema "groups" do
    field :photo_url, :string
    belongs_to :belt, Boilerplate.Belt
    belongs_to :batch, Boilerplate.Batch
    belongs_to :master_sensei, Boilerplate.MasterSensei

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:photo_url])
    |> validate_required([:photo_url])
  end
end
