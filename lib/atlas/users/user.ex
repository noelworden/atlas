defmodule Atlas.Users.User do
  @moduledoc """
  Module for users
  """
  use Ecto.Schema
  use Pow.Ecto.Schema

  schema "users" do
    pow_user_fields()

    timestamps()
  end

  @doc """
  User
  |> Repo.get_by!(email: <user email>)
  |> User.update_password_changeset(password)
  |> Repo.update()
  """

  def update_password_changeset(user \\ %__MODULE__{}, password) do
    user
    |> pow_password_changeset(%{
      password: password,
      password_confirmation: password
    })
  end
end
