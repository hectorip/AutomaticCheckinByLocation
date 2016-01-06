defmodule AutomaticAttendance.AttendanceListController do
  use AutomaticAttendance.Web, :controller

  alias AutomaticAttendance.AttendanceList

  plug :scrub_params, "attendance_list" when action in [:create, :update]

  def index(conn, _params) do
    attendancelists = Repo.all(AttendanceList)
    render(conn, "index.html", attendancelists: attendancelists)
  end

  def new(conn, _params) do
    changeset = AttendanceList.changeset(%AttendanceList{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"attendance_list" => attendance_list_params}) do
    changeset = AttendanceList.changeset(%AttendanceList{}, attendance_list_params)

    case Repo.insert(changeset) do
      {:ok, _attendance_list} ->
        conn
        |> put_flash(:info, "Attendance list created successfully.")
        |> redirect(to: attendance_list_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    attendance_list = Repo.get!(AttendanceList, id)
    render(conn, "show.html", attendance_list: attendance_list)
  end

  def edit(conn, %{"id" => id}) do
    attendance_list = Repo.get!(AttendanceList, id)
    changeset = AttendanceList.changeset(attendance_list)
    render(conn, "edit.html", attendance_list: attendance_list, changeset: changeset)
  end

  def update(conn, %{"id" => id, "attendance_list" => attendance_list_params}) do
    attendance_list = Repo.get!(AttendanceList, id)
    changeset = AttendanceList.changeset(attendance_list, attendance_list_params)

    case Repo.update(changeset) do
      {:ok, attendance_list} ->
        conn
        |> put_flash(:info, "Attendance list updated successfully.")
        |> redirect(to: attendance_list_path(conn, :show, attendance_list))
      {:error, changeset} ->
        render(conn, "edit.html", attendance_list: attendance_list, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    attendance_list = Repo.get!(AttendanceList, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(attendance_list)

    conn
    |> put_flash(:info, "Attendance list deleted successfully.")
    |> redirect(to: attendance_list_path(conn, :index))
  end
end
