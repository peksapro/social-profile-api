defmodule ProfileApiWeb.Router do
  use ProfileApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ProfileApiWeb do
    pipe_through :api
  end
end
