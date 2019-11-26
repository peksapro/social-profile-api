defmodule ProfileApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    required_fields = [:name, :email, :password]
    user
    |> cast(attrs, required_fields)
    |> validate_required(required_fields)
    |> validate_length(:name, min: 3)
    |> validate_length(:password, min: 8)
    |> unique_constraint(:email)
    |> unique_constraint(:name)
    |> hash_password()
  end

  defp hash_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash, Pbkdf2.hash_pwd_salt(password))
      _ ->
        changeset
    end
  end
end
