defmodule Boilerplate.BatchController do
  use Boilerplate.Web, :controller

  alias Boilerplate.Batch

  def index(conn, _params) do
    batches = Repo.all(Batch)
    render(conn, "index.html", batches: batches)
  end

  def new(conn, _params) do
    changeset = Batch.changeset(%Batch{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"batch" => batch_params}) do
    changeset = Batch.changeset(%Batch{}, batch_params)

    case Repo.insert(changeset) do
      {:ok, _batch} ->
        conn
        |> put_flash(:info, "Batch created successfully.")
        |> redirect(to: batch_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    batch = Repo.get!(Batch, id)
    render(conn, "show.html", batch: batch)
  end

  def edit(conn, %{"id" => id}) do
    batch = Repo.get!(Batch, id)
    changeset = Batch.changeset(batch)
    render(conn, "edit.html", batch: batch, changeset: changeset)
  end

  def update(conn, %{"id" => id, "batch" => batch_params}) do
    batch = Repo.get!(Batch, id)
    changeset = Batch.changeset(batch, batch_params)

    case Repo.update(changeset) do
      {:ok, batch} ->
        conn
        |> put_flash(:info, "Batch updated successfully.")
        |> redirect(to: batch_path(conn, :show, batch))
      {:error, changeset} ->
        render(conn, "edit.html", batch: batch, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    batch = Repo.get!(Batch, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(batch)

    conn
    |> put_flash(:info, "Batch deleted successfully.")
    |> redirect(to: batch_path(conn, :index))
  end
end
