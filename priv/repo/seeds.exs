# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ProfileApi.Repo.insert!(%ProfileApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias ProfileApi.Repo
alias ProfileApi.Accounts.User
alias ProfileApi.Social.Profile

%User{
  name: "John Snow",
  email: "js@gameofthrones",
  password_hash: "test1234"
} |> Repo.insert!

%User{
  name: "Sansa Stark",
  email: "ss@gameofthrones",
  password_hash: "test1234"
} |> Repo.insert!

%User{
  name: "Arya Stark",
  email: "as@gameofthrones",
  password_hash: "test1234"
} |> Repo.insert!

%User{
  name: "Ned Stark",
  email: "ns@gameofthrones",
  password_hash: "test1234"
} |> Repo.insert!

%User{
  name: "Robb Stark",
  email: "rs@gameofthrones",
  password_hash: "test1234"
} |> Repo.insert!

%User{
  name: "Brann Stark",
  email: "bs@gameofthrones",
  password_hash: "test1234"
} |> Repo.insert!

%Profile{
  name: "Insta boy",
  platform: "instagram",
  user_id: 1
} |> Repo.insert!

%Profile{
  name: "Insta boy",
  platform: "facebook",
  user_id: 1
} |> Repo.insert!
%Profile{
  name: "Insta boy 2",
  platform: "instagram",
  user_id: 2
} |> Repo.insert!

%Profile{
  name: "Insta boy 2",
  platform: "facebook",
  user_id: 2
} |> Repo.insert!
%Profile{
  name: "Insta boy 3",
  platform: "instagram",
  user_id: 3
} |> Repo.insert!

%Profile{
  name: "Insta boy 3",
  platform: "facebook",
  user_id: 3
} |> Repo.insert!
%Profile{
  name: "Insta girl",
  platform: "instagram",
  user_id: 4
} |> Repo.insert!

%Profile{
  name: "Insta girl",
  platform: "facebook",
  user_id: 4
} |> Repo.insert!
%Profile{
  name: "Insta girl 2",
  platform: "instagram",
  user_id: 5
} |> Repo.insert!

%Profile{
  name: "Insta girl 2",
  platform: "facebook",
  user_id: 5
} |> Repo.insert!
%Profile{
  name: "Insta girl 3",
  platform: "instagram",
  user_id: 6
} |> Repo.insert!

%Profile{
  name: "Insta girl 3",
  platform: "facebook",
  user_id: 6
} |> Repo.insert!