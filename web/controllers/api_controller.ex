defmodule Boilerplate.ApiController do
  use Boilerplate.Web, :controller

  def assitance(conn, _params) do
    json conn, "true"
  end
end