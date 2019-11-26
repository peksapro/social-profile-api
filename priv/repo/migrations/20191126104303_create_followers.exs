defmodule ProfileApi.Repo.Migrations.CreateFollowers do
  use Ecto.Migration

  def change do
    create table(:followers, primary_key: false) do
      add :profile_id, references(:profiles, on_delete: :delete_all), null: false
      add :follower_id, references(:profiles, on_delete: :delete_all), null: false

      timestamps()
    end

    create unique_index(:followers, [:profile_id, :follower_id], name: :social_follower_idx)
  end
end
