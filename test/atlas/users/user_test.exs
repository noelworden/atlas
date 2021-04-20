defmodule Atlas.Users.UserTest do
  use Atlas.DataCase

  alias Atlas.Repo
  alias Atlas.Users.User

  describe "user" do
    test "creation is successful when proper credentials are passed" do
      assert {:ok, user} = create_user()

      assert user.email == "test@test.com"
    end

    test "creation fails when password_confirmation is not passed" do
      assert {:error, _user} = create_user(%{password_confirmation: nil})
    end

    test "creation fails when passwords do not match" do
      assert {:error, _user} = create_user(%{password: "password_one"})
    end

    test "can have its password updated" do
      {:ok, user} = create_user()

      assert {:ok, _user} =
               user
               |> User.update_password_changeset("updated_password")
               |> Repo.update()
    end
  end

  defp create_user(fields_to_update \\ %{}) do
    user_changeset =
      Map.merge(
        %{
          email: "test@test.com",
          password: "password",
          password_confirmation: "password"
        },
        fields_to_update
      )

    %User{}
    |> User.changeset(user_changeset)
    |> Repo.insert()
  end
end
