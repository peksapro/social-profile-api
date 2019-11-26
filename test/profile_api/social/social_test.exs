defmodule ProfileApi.SocialTest do
  use ProfileApi.DataCase

  alias ProfileApi.Social
  alias ProfileApi.Social.{Profile, Follower}


  describe "profiles" do
    alias ProfileApi.Social.Profile

    @update_attrs %{name: "some updated name", platform: "Facebook"}

    test "list_profiles/0 returns all profiles" do
      user = ProfileApi.TestHelpers.user_fixture()
      profile = ProfileApi.TestHelpers.profile_fixture(user)
      assert Social.list_profiles() == [profile]
    end

    test "get_profile!/1 returns the profile with given id" do
      user = ProfileApi.TestHelpers.user_fixture()
      profile = ProfileApi.TestHelpers.profile_fixture(user)
      assert profile.id == Social.Profile.get_profile(profile.id).id

    end

    test "create_profile/1 with valid data creates a profile" do
      user = ProfileApi.TestHelpers.user_fixture()
      valid_attrs =  %{name: "some name", platform: "Twitter", user_id: user.id}
      assert {:ok, %Profile{} = profile} = Social.create_profile(user,valid_attrs)
      assert profile.name == "some name"
      assert profile.platform == "twitter"
    end
"""

    test "create_profile/1 with invalid data returns error changeset" do
      user = ProfileApi.TestHelpers.user_fixture()
      invalid_attrs = %{name: nil, platform: nil, user_id: user.id}
      assert {:error, %Ecto.Changeset{}} = Social.create_profile(invalid_attrs)
    end

    test "update_profile/2 with valid data updates the profile" do
      user = ProfileApi.TestHelpers.user_fixture()
      profile = ProfileApi.TestHelpers.profile_fixture(user)
      assert {:ok, %Profile{} = profile} = Social.update_profile(profile, @update_attrs)
      assert profile.name == "some updated name"
      assert profile.platform == "some updated platform"
    end

    test "update_profile/2 with invalid data returns error changeset" do
      user = ProfileApi.TestHelpers.user_fixture()
      profile = ProfileApi.TestHelpers.profile_fixture(user)
      invalid_attrs = %{name: nil, platform: nil, user_id: user.id}
      assert {:error, %Ecto.Changeset{}} = Social.update_profile(profile, invalid_attrs)
      assert profile == Social.get_profile!(profile.id)
    end

    test "delete_profile/1 deletes the profile" do
      user = ProfileApi.TestHelpers.user_fixture()
      profile = ProfileApi.TestHelpers.profile_fixture(user)
      assert {:ok, %Profile{}} = Social.delete_profile(profile)
      assert_raise Ecto.NoResultsError, fn -> Social.get_profile!(profile.id) end
    end

    test "change_profile/1 returns a profile changeset" do
      user = ProfileApi.TestHelpers.user_fixture()
      profile = ProfileApi.TestHelpers.profile_fixture(user)
      assert %Ecto.Changeset{} = Social.change_profile(profile)
    end
    """
  end


  describe "followers" do
    test "list_followers/0 returns all followers" do
      follower = ProfileApi.TestHelpers.follower_fixture()
      assert Social.list_followers() == [follower]
    end
"""
    test "get_follower!/1 returns the follower with given id" do
      follower = follower_fixture()
      assert Social.get_follower!(follower.id) == follower
    end

    test "create_follower/1 with valid data creates a follower" do
      assert {:ok, %Follower{} = follower} = Social.create_follower(@valid_attrs)
    end

    test "create_follower/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Social.create_follower(@invalid_attrs)
    end

    test "update_follower/2 with valid data updates the follower" do
      follower = follower_fixture()
      assert {:ok, %Follower{} = follower} = Social.update_follower(follower, @update_attrs)
    end

    test "update_follower/2 with invalid data returns error changeset" do
      follower = follower_fixture()
      assert {:error, %Ecto.Changeset{}} = Social.update_follower(follower, @invalid_attrs)
      assert follower == Social.get_follower!(follower.id)
    end

    test "delete_follower/1 deletes the follower" do
      follower = follower_fixture()
      assert {:ok, %Follower{}} = Social.delete_follower(follower)
      assert_raise Ecto.NoResultsError, fn -> Social.get_follower!(follower.id) end
    end

    test "change_follower/1 returns a follower changeset" do
      follower = follower_fixture()
      assert %Ecto.Changeset{} = Social.change_follower(follower)
    end
"""
  end
end
