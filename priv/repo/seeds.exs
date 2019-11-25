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