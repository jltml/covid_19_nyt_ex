defmodule Covid19Web.Router do
  use Covid19Web, :router

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

  scope "/", Covid19Web do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", Covid19Web, as: :api do
    pipe_through :api
    resources "/states", StateController, only: [:show, :index]
  end
end
