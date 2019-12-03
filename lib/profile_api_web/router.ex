defmodule ProfileApiWeb.Router do
  @moduledoc """
  The Profile Api router.
  """
  use ProfileApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/api", Absinthe.Plug,
            schema: ProfileApiWeb.Schema.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
            schema: ProfileApiWeb.Schema.Schema,
            socket: ProfileApiWeb.UserSocket
  end
end
