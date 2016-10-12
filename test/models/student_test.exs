defmodule Boilerplate.StudentTest do
  use Boilerplate.ModelCase

  alias Boilerplate.Student

  @valid_attrs %{bio: "some content", email: "some content", first_last_name: "some content", first_name: "some content", phone: "some content", photo_url: "some content", second_last_name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Student.changeset(%Student{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Student.changeset(%Student{}, @invalid_attrs)
    refute changeset.valid?
  end
end
