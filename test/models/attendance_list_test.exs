defmodule AutomaticAttendance.AttendanceListTest do
  use AutomaticAttendance.ModelCase

  alias AutomaticAttendance.AttendanceList

  @valid_attrs %{attendant_count: 42, description: "some content", end_date: "2010-04-17", name: "some content", place: "some content", start_date: "2010-04-17"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = AttendanceList.changeset(%AttendanceList{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = AttendanceList.changeset(%AttendanceList{}, @invalid_attrs)
    refute changeset.valid?
  end
end
