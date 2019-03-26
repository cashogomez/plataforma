defmodule PlataformaWeb.Router do
  use PlataformaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PlataformaWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/jugadores", JugadorController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PlataformaWeb do
  #   pipe_through :api
  # end
end
