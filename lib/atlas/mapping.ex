defmodule Atlas.Mapping do
  @moduledoc """
  All actions necessary to CRUD a `destination`
  """

  import Ecto.Query, warn: false
  alias Atlas.{Mapping.Destination, Repo}

  def list_filtered_destinations(season, lake) do
    Destination
    |> season_filter(season)
    |> lake_filter(lake)
    |> Repo.all()
  end

  def string_to_boolean(string) do
    case string do
      "true" -> true
      "false" -> false
      _ -> ""
    end
  end

  def get_coordinates(destinations) do
    destinations
    |> Enum.map(fn destination ->
      Map.take(destination, [:longitude, :latitude])
      |> Map.values()
      |> Enum.reverse()
      |> Enum.map(fn coordinate -> Decimal.to_float(coordinate) end)
    end)
    |> Jason.encode()
    |> case do
      {:ok, result} ->
        result

      _ ->
        "[]"
    end
  end

  # If no destinations are present, set long/lat to Longmont, CO
  def find_median_coordinates(field, []) do
    cond do
      field == :longitude ->
        -105.101

      field == :latitude ->
        40.135
    end
  end

  def find_median_coordinates(field, destinations) do
    total =
      destinations
      |> Enum.map(fn destination ->
        Map.take(destination, [field])
        |> Map.values()
        |> Enum.map(fn coordinate -> Decimal.to_float(coordinate) end)
      end)
      |> List.flatten()
      |> Enum.reduce(fn item, acc -> item + acc end)

    total / Enum.count(destinations)
  end

  def get_names(destinations) do
    destinations
    |> Enum.map(fn destination ->
      Map.take(destination, [:name])
      |> Map.values()
    end)
    |> Jason.encode()
    |> case do
      {:ok, result} ->
        result

      _ ->
        "[]"
    end
  end

  def season_options do
    [
      {"Spring", "spring"},
      {"Summer", "summer"},
      {"Fall", "fall"},
      {"Winter", "winter"},
      {"Ice Fishing", "ice"}
    ]
  end

  def lake_options do
    [
      {"Lake", true},
      {"River & Stream", false}
    ]
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

  defp season_filter(query, season) do
    case season do
      "spring" -> from(d in query, where: d.season_spring)
      "summer" -> from(d in query, where: d.season_summer)
      "fall" -> from(d in query, where: d.season_fall)
      "winter" -> from(d in query, where: d.season_winter)
      "ice" -> from(d in query, where: d.ice_fishing)
      _ -> query
    end
  end

  defp lake_filter(query, lake) do
    if lake == true || lake == false do
      from(d in query, where: d.lake == ^lake)
    else
      query
    end
  end
end
