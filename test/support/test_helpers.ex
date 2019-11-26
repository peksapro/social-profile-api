defmodule ProfileApi.TestHelpers do
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
end