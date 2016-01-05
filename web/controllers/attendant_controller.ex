defmodule AutomaticAttendance.AttendantController do
  use AutomaticAttendance.Web, :controller

  alias AutomaticAttendance.Attendant

  plug :scrub_params, "attendant" when action in [:create, :update]

  def index(conn, _params) do
    attendants = Repo.all(Attendant)
    render(conn, "index.html", attendants: attendants)
  end

  def new(conn, _params) do
    changeset = Attendant.changeset(%Attendant{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"attendant" => attendant_params}) do
    changeset = Attendant.changeset(%Attendant{}, attendant_params)

    case Repo.insert(changeset) do
      {:ok, _attendant} ->
        conn
        |> put_flash(:info, "Attendant created successfully.")
        |> redirect(to: attendant_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    attendant = Repo.get!(Attendant, id)
    render(conn, "show.html", attendant: attendant)
  end

  def edit(conn, %{"id" => id}) do
    attendant = Repo.get!(Attendant, id)
    changeset = Attendant.changeset(attendant)
    render(conn, "edit.html", attendant: attendant, changeset: changeset)
  end

  def update(conn, %{"id" => id, "attendant" => attendant_params}) do
    attendant = Repo.get!(Attendant, id)
    changeset = Attendant.changeset(attendant, attendant_params)

    case Repo.update(changeset) do
      {:ok, attendant} ->
        conn
        |> put_flash(:info, "Attendant updated successfully.")
        |> redirect(to: attendant_path(conn, :show, attendant))
      {:error, changeset} ->
        render(conn, "edit.html", attendant: attendant, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    attendant = Repo.get!(Attendant, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(attendant)

    conn
    |> put_flash(:info, "Attendant deleted successfully.")
    |> redirect(to: attendant_path(conn, :index))
  end
end
