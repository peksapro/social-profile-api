defmodule ProfileApiWeb.Resolvers.Social do
  alias ProfileApi.Social
  alias ProfileApiWeb.Schema.ChangesetErrors

  @spec profile(any, %{id: any}, any) :: {:ok, any}
  def profile(_, %{id: id}, _) do
    {:ok, Social.get_profile!(id)}
  end

  @spec profiles(any, any, any) :: {:ok, any}
  def profiles(_, args, _) do
    {:ok, Social.list_profiles(args)}
  end

  @spec get_profiles_with_followers_count(any, any, any) :: {:ok, any}
  def get_profiles_with_followers_count(_, _, _) do
    {:ok, Social.get_profiles_with_followers_count()}
  end

  def create_profile(_, args, _) do
    user = ProfileApi.Accounts.get_user(args[:user_id])
    case Social.create_profile(user, args) do
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
