defmodule ProfileApi.Social.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "profiles" do
    field :name, :string
    field :platform, :string

    belongs_to :user, ProfileApi.Accounts.User

    timestamps()
  end

  def changeset(profile, attrs) do
    required_fields = [:name, :platform]

    profile
    |> cast(attrs, required_fields)
    |> validate_required(required_fields)
    |> validate_length(:name, min: 3, max: 50)
    |> unique_constraint(:social_profile_idx_constraint, name: :social_profile_idx)
    |> assoc_constraint(:user)
    |> validate_social_platform
  end

  defp validate_social_platform(changeset)  do
    case changeset.valid? do
      true ->
        platform = get_field(changeset, :platform)
        platform
        |> format_social_platform()
        |> is_social_platform_allow?(changeset)
        |> put_change(:platform, platform)
    end
  end

  defp format_social_platform(platform) do
    platform
    |> String.trim()
    |> String.downcase()
  end

  defp is_social_platform_allow?(platform, changeset) do
    case Enum.member?(["facebook", "twitter", "instagram"], platform) do
      true -> changeset
      false -> add_error(changeset, :platform, "social platform is not allowed")
    end
  end
end