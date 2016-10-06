defmodule Boilerplate.BatchTest do
  use Boilerplate.ModelCase

  alias Boilerplate.Batch

  @valid_attrs %{logo_url: "some content", name: "some content", number: 42, photo_url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Batch.changeset(%Batch{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Batch.changeset(%Batch{}, @invalid_attrs)
    refute changeset.valid?
  end
end
