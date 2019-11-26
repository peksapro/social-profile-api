defmodule ProfileApi.SocialTest do
  use ProfileApi.DataCase

  alias ProfileApi.Social

  #I have a issue with virtual fields and foreign keys in test

  describe "profiles" do
    alias ProfileApi.Social.Profile

    @valid_attrs %{name: "some name", platform: "Twitter", user_id: 1}
    @update_attrs %{name: "some updated name", platform: "Facebook"}
    @invalid_attrs %{name: nil, platform: nil}

    def profile_fixture(attrs \\ %{}) do
      {:ok, profile} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Social.create_profile()

      profile
    end


    test "list_profiles/0 returns all profiles" do
      profile = profile_fixture()
      assert Social.list_profiles() == [profile]
    end

    test "get_profile!/1 returns the profile with given id" do
      profile = profile_fixture()
      assert Social.get_profile!(profile.id) == profile
    end

    test "create_profile/1 with valid data creates a profile" do
      assert {:ok, %Profile{} = profile} = Social.create_profile(@valid_attrs)
      assert profile.name == "some name"
      assert profile.platform == "some platform"
    end

    test "create_profile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Social.create_profile(@invalid_attrs)
    end

    test "update_profile/2 with valid data updates the profile" do
      profile = profile_fixture()
      assert {:ok, %Profile{} = profile} = Social.update_profile(profile, @update_attrs)
      assert profile.name == "some updated name"
      assert profile.platform == "some updated platform"
    end

    test "update_profile/2 with invalid data returns error changeset" do
      profile = profile_fixture()
      assert {:error, %Ecto.Changeset{}} = Social.update_profile(profile, @invalid_attrs)
      assert profile == Social.get_profile!(profile.id)
    end

    test "delete_profile/1 deletes the profile" do
      profile = profile_fixture()
      assert {:ok, %Profile{}} = Social.delete_profile(profile)
      assert_raise Ecto.NoResultsError, fn -> Social.get_profile!(profile.id) end
    end

    test "change_profile/1 returns a profile changeset" do
      profile = profile_fixture()
      assert %Ecto.Changeset{} = Social.change_profile(profile)
    end
  end

  describe "followers" do
    alias ProfileApi.Social.Follower

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def follower_fixture(attrs \\ %{}) do
      {:ok, follower} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Social.create_follower()

      follower
    end

    test "list_followers/0 returns all followers" do
      follower = follower_fixture()
      assert Social.list_followers() == [follower]
    end

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

  end

end
