defmodule Atlas.Mapping do
  @moduledoc """
  All actions necessary to CRUD a `destination`
  """

  import Ecto.Query, warn: false
  alias Atlas.{Mapping.Destination, Repo}
  alias Decimal, as: D

  def list_filtered_destinations(season, lake, distance, vehicle, dog, hike, camp, fee) do
    Destination
    |> season_filter(season)
    |> lake_filter(lake)
    |> distance_filter(distance)
    |> vehicle_filter(vehicle)
    |> dog_filter(dog)
    |> hike_filter(hike)
    |> camp_filter(camp)
    |> fee_filter(fee)
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
      |> Enum.map(fn coordinate -> D.to_float(coordinate) end)
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
        |> Enum.map(fn coordinate -> D.to_float(coordinate) end)
      end)
      |> List.flatten()
      |> Enum.reduce(fn item, acc -> item + acc end)

    D.to_float(D.div(D.from_float(total), Enum.count(destinations)))
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

  def distance_options do
    [
      {"1 hour or less", "less_than_one"},
      {"1 - 3 hours", "one_to_three"},
      {"3+ hours", "more_than_three"}
    ]
  end

  def vehicle_options do
    [
      {"Car", true},
      {"Truck", false}
    ]
  end

  def dog_options do
    [
      {"Dogs off leash", "off_leash"},
      {"Dogs on leash", "on_leash"},
      {"No dogs", "no_dog"}
    ]
  end

  def hike_options do
    [
      {"Hiking", true},
      {"Non-hiking", false}
    ]
  end

  def camp_options do
    [
      {"Car or Backpack Camping", "car_backpack"},
      {"Car Camp", "car"},
      {"Backpack Camp", "backpack"}
    ]
  end

  def fee_options do
    [{"No Fees", false}]
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

  defp distance_filter(query, distance) do
    case distance do
      "less_than_one" -> from(d in query, where: d.less_than_one_hour)
      "one_to_three" -> from(d in query, where: d.one_to_three_hours)
      "more_than_three" -> from(d in query, where: d.greater_than_three_hours)
      _ -> query
    end
  end

  defp vehicle_filter(query, vehicle) do
    if vehicle == true || vehicle == false do
      from(d in query, where: d.car_friendly == ^vehicle)
    else
      query
    end
  end

  defp dog_filter(query, dog) do
    case dog do
      "off_leash" -> from(d in query, where: d.allows_dogs and d.dogs_off_leash)
      "on_leash" -> from(d in query, where: d.allows_dogs and not d.dogs_off_leash)
      "no_dog" -> from(d in query, where: not d.allows_dogs)
      _ -> query
    end
  end

  defp hike_filter(query, hike) do
    if hike == true || hike == false do
      from(d in query, where: d.hike_in == ^hike)
    else
      query
    end
  end

  defp camp_filter(query, camp) do
    case camp do
      "car_backpack" -> from(d in query, where: d.car_camp or d.backpack_camp)
      "car" -> from(d in query, where: d.car_camp)
      "backpack" -> from(d in query, where: d.backpack_camp)
      _ -> query
    end
  end

  defp fee_filter(query, fee) do
    if fee == false do
      from(d in query, where: d.fee == ^fee)
    else
      query
    end
  end
end
