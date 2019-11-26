defmodule ProfileApi.TestHelpers do
  import Ecto.Query#, only: [from: 2]

  alias ProfileApi.Repo

  alias ProfileApi.Social.{Profile, Follower}
  alias ProfileApi.Accounts.User

  def user(name) do
    ProfileApi.Repo.get_by!(User, name: name)
  end

  def user_fixture(attrs \\ %{}) do
    name = "user-#{System.unique_integer([:positive])}"

    attrs =
      Enum.into(attrs, %{
      name: "test-user",
      email: attrs[:email] || "#{name}@example.com",
      password: attrs[:password] || "secret1234"
      })
    {:ok, user} =
      %User{}
      |> User.changeset(attrs)
      |> Repo.insert()

    user
  end

  def profile(name, platform) do
    Profile
    |> where([p], p.name == ^name and p.platform == ^platform)
    |> select([p], {p})
    |> first
    |> Repo.one()
    #from(u in User, where: u.username == name and u.email == platform)
    #|> Repo.one
  end

  def profile_fixture(%User{} = user, attrs \\ %{}) do
    name = "profile-#{System.unique_integer([:positive])}"
    platform = Enum.random(["facebook","twitter"])

    attrs =
      Enum.into(attrs, %{
        name: attrs[:name] || name,
        platform: attrs[:platform] || platform,
      })
    {:ok, profile} =
      %Profile{}
      |> Profile.changeset(attrs)
      |> Ecto.Changeset.put_assoc(:user, user)
      |> Repo.insert()

    profile
  end

  def follower_fixture() do
    inserted_at = NaiveDateTime.truncate(NaiveDateTime.utc_now, :second)
    updated_at = NaiveDateTime.truncate(NaiveDateTime.utc_now, :second)
    profile_random = ProfileApi.TestHelpers.user_fixture()
    follower_random = ProfileApi.TestHelpers.user_fixture()
    {:ok, follower} =
      Repo.insert_all(Follower, [%{profile_id: profile_random.id, follower_id: follower_random.id, inserted_at: inserted_at, updated_at: updated_at}])

    follower
  end
end