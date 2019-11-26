defmodule ProfileApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string, null: false
      add :email, :string, null: false
      add :password_hash, :string#, null: false - I don't know how feel virtual fields in seeds.exs

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end