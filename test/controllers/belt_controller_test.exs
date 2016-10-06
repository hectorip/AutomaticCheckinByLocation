defmodule Boilerplate.BeltControllerTest do
  use Boilerplate.ConnCase

  alias Boilerplate.Belt
  @valid_attrs %{description: "some content", logo: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, belt_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing belts"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, belt_path(conn, :new)
    assert html_response(conn, 200) =~ "New belt"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, belt_path(conn, :create), belt: @valid_attrs
    assert redirected_to(conn) == belt_path(conn, :index)
    assert Repo.get_by(Belt, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, belt_path(conn, :create), belt: @invalid_attrs
    assert html_response(conn, 200) =~ "New belt"
  end

  test "shows chosen resource", %{conn: conn} do
    belt = Repo.insert! %Belt{}
    conn = get conn, belt_path(conn, :show, belt)
    assert html_response(conn, 200) =~ "Show belt"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, belt_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    belt = Repo.insert! %Belt{}
    conn = get conn, belt_path(conn, :edit, belt)
    assert html_response(conn, 200) =~ "Edit belt"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    belt = Repo.insert! %Belt{}
    conn = put conn, belt_path(conn, :update, belt), belt: @valid_attrs
    assert redirected_to(conn) == belt_path(conn, :show, belt)
    assert Repo.get_by(Belt, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    belt = Repo.insert! %Belt{}
    conn = put conn, belt_path(conn, :update, belt), belt: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit belt"
  end

  test "deletes chosen resource", %{conn: conn} do
    belt = Repo.insert! %Belt{}
    conn = delete conn, belt_path(conn, :delete, belt)
    assert redirected_to(conn) == belt_path(conn, :index)
    refute Repo.get(Belt, belt.id)
  end
end
