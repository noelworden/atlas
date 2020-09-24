defmodule Atlas.Mapping.CSVUtil do
  @moduledoc """
    Utility module to ingest `destination.csv`
  """

  alias NimbleCSV.RFC4180, as: CSV
  alias Atlas.{Mapping, Mapping.Destination, Repo}

  def csv_row_to_table_record(file) do
    column_names = get_column_names(file)

    file
    |> File.stream!()
    |> CSV.parse_stream(skip_headers: true)
    |> Enum.map(fn row ->
      row
      |> Enum.with_index()
      |> Map.new(fn {val, num} -> {column_names[num], val} end)
      |> create_or_skip()
    end)
  end

  defp get_column_names(file) do
    file
    |> File.stream!()
    |> CSV.parse_stream(skip_headers: false)
    |> Enum.fetch!(0)
    |> Enum.with_index()
    |> Map.new(fn {val, num} -> {num, val} end)
  end

  defp create_or_skip(row) do
    case Repo.get_by(Destination,
           latitude: row["latitude"],
           longitude: row["longitude"]
         ) do
      nil ->
        Mapping.create_destination(%{
          longitude: Decimal.new(row["longitude"]),
          latitude: Decimal.new(row["latitude"]),
          name: row["name"],
          description: row["description"],
          spinner_friendly: row["spinner_friendly"],
          lake: row["lake"],
          less_than_one_hour: row["less_than_one_hour"],
          one_to_three_hours: row["one_to_three_hours"],
          greater_than_three_hours: row["greater_than_three_hours"],
          car_friendly: row["car_friendly"],
          hike_in: row["hike_in"],
          allows_dogs: row["allows_dogs"],
          dogs_off_leash: row["dogs_off_leash"],
          season_spring: row["season_spring"],
          season_summer: row["season_summer"],
          season_fall: row["season_fall"],
          season_winter: row["season_winter"],
          car_camp: row["car_camp"],
          backpack_camp: row["backpack_camp"],
          fee: row["fee"],
          ice_fishing: row["ice_fishing"]
        })

      destination ->
        {:ok, destination}
    end
  end
end
