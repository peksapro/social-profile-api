defmodule ProfileApi.Social.Follower do
  use Ecto.Schema
  import Ecto.Changeset
  @primary_key false
  schema "followers" do
    field :profile_id, :id
    field :follower_id, :id

    timestamps()
  end

  @doc false
  def changeset(follower, attrs) do
    follower
    |> cast(attrs, [])
    |> validate_required([])
    |> unique_constraint(:social_follower_idx_constraint, name: :social_follower_idx)
  end
end
