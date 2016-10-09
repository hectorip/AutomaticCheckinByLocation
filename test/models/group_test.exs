defmodule Boilerplate.GroupTest do
  use Boilerplate.ModelCase

  alias Boilerplate.Group

  @valid_attrs %{photo_url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Group.changeset(%Group{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Group.changeset(%Group{}, @invalid_attrs)
    refute changeset.valid?
  end
end
