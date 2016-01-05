defmodule AutomaticAttendance.AttendantControllerTest do
  use AutomaticAttendance.ConnCase

  alias AutomaticAttendance.Attendant
  @valid_attrs %{active: true, extra_data: "some content", image: "some content", key: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, attendant_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing attendants"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, attendant_path(conn, :new)
    assert html_response(conn, 200) =~ "New attendant"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, attendant_path(conn, :create), attendant: @valid_attrs
    assert redirected_to(conn) == attendant_path(conn, :index)
    assert Repo.get_by(Attendant, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, attendant_path(conn, :create), attendant: @invalid_attrs
    assert html_response(conn, 200) =~ "New attendant"
  end

  test "shows chosen resource", %{conn: conn} do
    attendant = Repo.insert! %Attendant{}
    conn = get conn, attendant_path(conn, :show, attendant)
    assert html_response(conn, 200) =~ "Show attendant"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, attendant_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    attendant = Repo.insert! %Attendant{}
    conn = get conn, attendant_path(conn, :edit, attendant)
    assert html_response(conn, 200) =~ "Edit attendant"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    attendant = Repo.insert! %Attendant{}
    conn = put conn, attendant_path(conn, :update, attendant), attendant: @valid_attrs
    assert redirected_to(conn) == attendant_path(conn, :show, attendant)
    assert Repo.get_by(Attendant, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    attendant = Repo.insert! %Attendant{}
    conn = put conn, attendant_path(conn, :update, attendant), attendant: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit attendant"
  end

  test "deletes chosen resource", %{conn: conn} do
    attendant = Repo.insert! %Attendant{}
    conn = delete conn, attendant_path(conn, :delete, attendant)
    assert redirected_to(conn) == attendant_path(conn, :index)
    refute Repo.get(Attendant, attendant.id)
  end
end
