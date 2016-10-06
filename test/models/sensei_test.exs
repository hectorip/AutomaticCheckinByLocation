defmodule Boilerplate.SenseiTest do
  use Boilerplate.ModelCase

  alias Boilerplate.Sensei

  @valid_attrs %{bio: "some content", first_name: "some content", last_name: "some content", photo_url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Sensei.changeset(%Sensei{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Sensei.changeset(%Sensei{}, @invalid_attrs)
    refute changeset.valid?
  end
end
