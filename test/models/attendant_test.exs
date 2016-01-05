defmodule AutomaticAttendance.AttendantTest do
  use AutomaticAttendance.ModelCase

  alias AutomaticAttendance.Attendant

  @valid_attrs %{active: true, extra_data: "some content", image: "some content", key: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Attendant.changeset(%Attendant{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Attendant.changeset(%Attendant{}, @invalid_attrs)
    refute changeset.valid?
  end
end
