defmodule Boilerplate.SenseiController do
  use Boilerplate.Web, :controller

  alias Boilerplate.Sensei

  def index(conn, _params) do
    senseis = Repo.all(Sensei)
    render(conn, "index.html", senseis: senseis)
  end

  def new(conn, _params) do
    changeset = Sensei.changeset(%Sensei{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"sensei" => sensei_params}) do
    changeset = Sensei.changeset(%Sensei{}, sensei_params)

    case Repo.insert(changeset) do
      {:ok, _sensei} ->
        conn
        |> put_flash(:info, "Sensei created successfully.")
        |> redirect(to: sensei_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    sensei = Repo.get!(Sensei, id)
    render(conn, "show.html", sensei: sensei)
  end

  def edit(conn, %{"id" => id}) do
    sensei = Repo.get!(Sensei, id)
    changeset = Sensei.changeset(sensei)
    render(conn, "edit.html", sensei: sensei, changeset: changeset)
  end

  def update(conn, %{"id" => id, "sensei" => sensei_params}) do
    sensei = Repo.get!(Sensei, id)
    changeset = Sensei.changeset(sensei, sensei_params)

    case Repo.update(changeset) do
      {:ok, sensei} ->
        conn
        |> put_flash(:info, "Sensei updated successfully.")
        |> redirect(to: sensei_path(conn, :show, sensei))
      {:error, changeset} ->
        render(conn, "edit.html", sensei: sensei, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    sensei = Repo.get!(Sensei, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(sensei)

    conn
    |> put_flash(:info, "Sensei deleted successfully.")
    |> redirect(to: sensei_path(conn, :index))
  end
end
