defmodule Atlas.Mapping do
  @moduledoc """
  All actions necessary to CRUD a `destination`
  """

  import Ecto.Query, warn: false
  alias Atlas.Repo

  alias Atlas.Mapping.Destination

  def list_destinations(filter) do
    # Can this be refactored?
    case filter do
      "spring" -> Repo.all(from(d in Destination, where: d.season_spring))
      "summer" -> Repo.all(from(d in Destination, where: d.season_summer))
      "fall" -> Repo.all(from(d in Destination, where: d.season_fall))
      "winter" -> Repo.all(from(d in Destination, where: d.season_winter))
      "ice" -> Repo.all(from(d in Destination, where: d.ice_fishing))
      _ -> Repo.all(Destination)
    end
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
