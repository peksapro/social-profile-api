defmodule ProfileApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :password_hash, :string

      timestamps()
    end

    create unique_index(:users, [:email])
    #create unique_index(:your_table, [:col1, :col2], name: :your_index_name)
  end


end