defmodule Boilerplate.BeltTest do
  use Boilerplate.ModelCase

  alias Boilerplate.Belt

  @valid_attrs %{description: "some content", logo: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Belt.changeset(%Belt{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Belt.changeset(%Belt{}, @invalid_attrs)
    refute changeset.valid?
  end
end
