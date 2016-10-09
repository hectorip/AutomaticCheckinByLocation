defmodule Boilerplate.Router do
  use Boilerplate.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Boilerplate.Auth, repo: Boilerplate.Repo 
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Boilerplate do
    pipe_through :browser # Use the default browser stack

    resources "/session", SessionController, only: [:new, :create, :delete]
    get "/register", UserController, :register
    post "/register", UserController, :register_user
    get "/", PageController, :index
  end

  scope "/admin", Boilerplate do
    pipe_through [:browser, :authenticate_user]
    resources "/users", UserController
    resources "/batches", BatchController
    resources "/belts", BeltController
    resources "/senseis", SenseiController
    resources "/venues", VenueController
    resources "/groups", GroupController
  end
  # Other scopes may use custom stacks.
  scope "/api", Boilerplate do
     pipe_through :api
     post "/assitance", ApiController, :assitance
  end
end
