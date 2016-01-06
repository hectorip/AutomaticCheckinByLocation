defmodule AutomaticAttendance.AttendanceListControllerTest do
  use AutomaticAttendance.ConnCase

  alias AutomaticAttendance.AttendanceList
  @valid_attrs %{attendant_count: 42, description: "some content", end_date: "2010-04-17", name: "some content", place: "some content", start_date: "2010-04-17"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, attendance_list_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing attendancelists"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, attendance_list_path(conn, :new)
    assert html_response(conn, 200) =~ "New attendance list"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, attendance_list_path(conn, :create), attendance_list: @valid_attrs
    assert redirected_to(conn) == attendance_list_path(conn, :index)
    assert Repo.get_by(AttendanceList, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, attendance_list_path(conn, :create), attendance_list: @invalid_attrs
    assert html_response(conn, 200) =~ "New attendance list"
  end

  test "shows chosen resource", %{conn: conn} do
    attendance_list = Repo.insert! %AttendanceList{}
    conn = get conn, attendance_list_path(conn, :show, attendance_list)
    assert html_response(conn, 200) =~ "Show attendance list"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, attendance_list_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    attendance_list = Repo.insert! %AttendanceList{}
    conn = get conn, attendance_list_path(conn, :edit, attendance_list)
    assert html_response(conn, 200) =~ "Edit attendance list"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    attendance_list = Repo.insert! %AttendanceList{}
    conn = put conn, attendance_list_path(conn, :update, attendance_list), attendance_list: @valid_attrs
    assert redirected_to(conn) == attendance_list_path(conn, :show, attendance_list)
    assert Repo.get_by(AttendanceList, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    attendance_list = Repo.insert! %AttendanceList{}
    conn = put conn, attendance_list_path(conn, :update, attendance_list), attendance_list: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit attendance list"
  end

  test "deletes chosen resource", %{conn: conn} do
    attendance_list = Repo.insert! %AttendanceList{}
    conn = delete conn, attendance_list_path(conn, :delete, attendance_list)
    assert redirected_to(conn) == attendance_list_path(conn, :index)
    refute Repo.get(AttendanceList, attendance_list.id)
  end
end
