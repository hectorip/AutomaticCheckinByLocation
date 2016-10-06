defmodule Boilerplate.BeltController do
  use Boilerplate.Web, :controller

  alias Boilerplate.Belt

  def index(conn, _params) do
    belts = Repo.all(Belt)
    render(conn, "index.html", belts: belts)
  end

  def new(conn, _params) do
    changeset = Belt.changeset(%Belt{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"belt" => belt_params}) do
    changeset = Belt.changeset(%Belt{}, belt_params)

    case Repo.insert(changeset) do
      {:ok, _belt} ->
        conn
        |> put_flash(:info, "Belt created successfully.")
        |> redirect(to: belt_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    belt = Repo.get!(Belt, id)
    render(conn, "show.html", belt: belt)
  end

  def edit(conn, %{"id" => id}) do
    belt = Repo.get!(Belt, id)
    changeset = Belt.changeset(belt)
    render(conn, "edit.html", belt: belt, changeset: changeset)
  end

  def update(conn, %{"id" => id, "belt" => belt_params}) do
    belt = Repo.get!(Belt, id)
    changeset = Belt.changeset(belt, belt_params)

    case Repo.update(changeset) do
      {:ok, belt} ->
        conn
        |> put_flash(:info, "Belt updated successfully.")
        |> redirect(to: belt_path(conn, :show, belt))
      {:error, changeset} ->
        render(conn, "edit.html", belt: belt, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    belt = Repo.get!(Belt, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(belt)

    conn
    |> put_flash(:info, "Belt deleted successfully.")
    |> redirect(to: belt_path(conn, :index))
  end
end
