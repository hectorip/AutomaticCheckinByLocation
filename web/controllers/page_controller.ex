defmodule Boilerplate.PageController do
  use Boilerplate.Web, :controller

  def index(conn, params = %{"user_id" => user_id, "lat" => lat, "lon" => lon}) do
    
    render conn, "index.html"
  end
end
