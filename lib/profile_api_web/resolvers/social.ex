defmodule ProfileApiWeb.Resolvers.Social do
  alias ProfileApi.Social
  alias ProfileApiWeb.Schema.ChangesetErrors

  def profile(_, %{id: id}, _) do
    {:ok, ProfileApi.Social.get_profile!(id)}
  end

  def profiles(_, args, _) do
    {:ok, ProfileApi.Social.list_profiles(args)}
  end

  def get_profiles_with_followers_count(_, _, _) do
    {:ok, ProfileApi.Social.get_profiles_with_followers_count()}
  end

  def create_profile(_, args, _) do
    user = ProfileApi.Accounts.get_user(args[:user_id])
    case ProfileApi.Social.create_profile(user, args) do
      {:error, changeset} ->
        {:error,
          message: "Could not create profile!",
          details: ChangesetErrors.error_details(changeset)
        }
      {:ok, profile} ->
        {:ok, profile}
    end
  end

end