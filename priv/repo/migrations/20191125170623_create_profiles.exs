defmodule ProfileApi.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def change do
    create table(:profiles) do
      add :name, :string, null: false
      add :platform, :string, null: false
      add :user_id, references(:users), null: false
      timestamps()
    end

    create unique_index(:profiles, [:name, :platform], name: :social_profile_idx)
  end
end