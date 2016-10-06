defmodule Boilerplate.SenseiControllerTest do
  use Boilerplate.ConnCase

  alias Boilerplate.Sensei
  @valid_attrs %{bio: "some content", first_name: "some content", last_name: "some content", photo_url: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, sensei_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing senseis"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, sensei_path(conn, :new)
    assert html_response(conn, 200) =~ "New sensei"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, sensei_path(conn, :create), sensei: @valid_attrs
    assert redirected_to(conn) == sensei_path(conn, :index)
    assert Repo.get_by(Sensei, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, sensei_path(conn, :create), sensei: @invalid_attrs
    assert html_response(conn, 200) =~ "New sensei"
  end

  test "shows chosen resource", %{conn: conn} do
    sensei = Repo.insert! %Sensei{}
    conn = get conn, sensei_path(conn, :show, sensei)
    assert html_response(conn, 200) =~ "Show sensei"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, sensei_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    sensei = Repo.insert! %Sensei{}
    conn = get conn, sensei_path(conn, :edit, sensei)
    assert html_response(conn, 200) =~ "Edit sensei"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    sensei = Repo.insert! %Sensei{}
    conn = put conn, sensei_path(conn, :update, sensei), sensei: @valid_attrs
    assert redirected_to(conn) == sensei_path(conn, :show, sensei)
    assert Repo.get_by(Sensei, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    sensei = Repo.insert! %Sensei{}
    conn = put conn, sensei_path(conn, :update, sensei), sensei: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit sensei"
  end

  test "deletes chosen resource", %{conn: conn} do
    sensei = Repo.insert! %Sensei{}
    conn = delete conn, sensei_path(conn, :delete, sensei)
    assert redirected_to(conn) == sensei_path(conn, :index)
    refute Repo.get(Sensei, sensei.id)
  end
end
