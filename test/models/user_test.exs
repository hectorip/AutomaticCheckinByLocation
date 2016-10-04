defmodule Boilerplate.UserTest do
  use Boilerplate.ModelCase

  alias Boilerplate.User

  @valid_attrs %{email: "some content", first_name: "some content", last_name: "some content", password_hash: "some content", status: 42, username: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
