defmodule ProfileApiWeb.Schema.Schema do
  use Absinthe.Schema
  alias ProfileApi.Accounts.User
  alias ProfileApi.Social.{Profile, Follower}

  query do
    @desc "Get a profile by id"
    field :profile, :profile do
      arg :id, non_null(:integer)
      resolve fn  _, %{id: id}, _ ->
        {:ok, ProfileApi.Social.get_profile!(id)}
      end
    end
  end

  object :profile do
    field :id, non_null(:id)
    field :user_id, non_null(:integer)
    field :name, non_null(:string)
    field :platform, non_null(:string)
  end

end