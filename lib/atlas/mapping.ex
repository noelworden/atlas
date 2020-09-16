defmodule Atlas.Mapping do
  @moduledoc """
  All actions necessary to CRUD a `destination`
  """

  import Ecto.Query, warn: false
  alias Atlas.Repo

  alias Atlas.Mapping.Destination

  def list_destinations do
    Repo.all(Destination)
  end

  def get_destination!(id), do: Repo.get!(Destination, id)

  def create_destination(attrs \\ %{}) do
    %Destination{}
    |> Destination.changeset(attrs)
    |> Repo.insert()
  end

  def update_destination(%Destination{} = destination, attrs) do
    destination
    |> Destination.changeset(attrs)
    |> Repo.update()
  end

  def delete_destination(%Destination{} = destination) do
    Repo.delete(destination)
  end

  def change_destination(%Destination{} = destination, attrs \\ %{}) do
    Destination.changeset(destination, attrs)
  end
end
