defmodule Boilerplate.BatchControllerTest do
  use Boilerplate.ConnCase

  alias Boilerplate.Batch
  @valid_attrs %{logo_url: "some content", name: "some content", number: 42, photo_url: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, batch_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing batches"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, batch_path(conn, :new)
    assert html_response(conn, 200) =~ "New batch"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, batch_path(conn, :create), batch: @valid_attrs
    assert redirected_to(conn) == batch_path(conn, :index)
    assert Repo.get_by(Batch, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, batch_path(conn, :create), batch: @invalid_attrs
    assert html_response(conn, 200) =~ "New batch"
  end

  test "shows chosen resource", %{conn: conn} do
    batch = Repo.insert! %Batch{}
    conn = get conn, batch_path(conn, :show, batch)
    assert html_response(conn, 200) =~ "Show batch"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, batch_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    batch = Repo.insert! %Batch{}
    conn = get conn, batch_path(conn, :edit, batch)
    assert html_response(conn, 200) =~ "Edit batch"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    batch = Repo.insert! %Batch{}
    conn = put conn, batch_path(conn, :update, batch), batch: @valid_attrs
    assert redirected_to(conn) == batch_path(conn, :show, batch)
    assert Repo.get_by(Batch, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    batch = Repo.insert! %Batch{}
    conn = put conn, batch_path(conn, :update, batch), batch: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit batch"
  end

  test "deletes chosen resource", %{conn: conn} do
    batch = Repo.insert! %Batch{}
    conn = delete conn, batch_path(conn, :delete, batch)
    assert redirected_to(conn) == batch_path(conn, :index)
    refute Repo.get(Batch, batch.id)
  end
end
