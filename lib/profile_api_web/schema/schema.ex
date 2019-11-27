defmodule ProfileApiWeb.Schema.Schema do
  use Absinthe.Schema
  alias ProfileApi.Accounts.User
  alias ProfileApi.Social.{Profile, Follower}
  alias ProfileApiWeb.Resolvers

  query do
    @desc "Get a profile by id"
    field :profile, :profile do
      arg :id, non_null(:integer)
      resolve &Resolvers.Social.profile/3
    end

    @desc "Get a list of profiles"
    field :profiles, list_of(:profile) do
      arg :limit, :integer
      arg :order, type: :sort_order, default_value: :asc
      arg :filter, type: :profile_filter
      resolve &Resolvers.Social.profiles/3
    end

    @desc "Get a list of profiles with max count followers"
    field :profiles_with_followers_number, list_of(:profile_with_followers_number) do
      resolve &Resolvers.Social.get_profiles_with_followers_count/3
    end

  end

  mutation do
    @desc "Create a profile"
    field :create_profile, :profile do
      arg :name, non_null(:string)
      arg :platform, non_null(:string)
      arg :user_id, non_null(:integer)
      resolve &Resolvers.Social.create_profile/3
    end
  end

  input_object :profile_filter do
    field :platform, :string
    field :user_id, :integer
  end

  enum :sort_order do
    value :asc
    value :desc
  end

  object :profile do
    field :id, non_null(:id)
    field :user_id, non_null(:integer)
    field :name, non_null(:string)
    field :platform, non_null(:string)
  end

  object :profile_with_followers_number do
    field :id, non_null(:id)
    field :user_id, non_null(:integer)
    field :name, non_null(:string)
    field :nubmer_of_followers, non_null(:integer)
  end


end