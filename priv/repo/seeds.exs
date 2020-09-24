# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Atlas.Repo.insert!(%Atlas.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# Seed `destinations` table from CSV
Atlas.Mapping.CSVUtil.csv_row_to_table_record("priv/repo/data/destinations.csv")

# destination_data = [
#   %{
#     longitude: -105.6929,
#     latitude: 39.8763,
#     name: "test name one",
#     description: "this is a test description one",
#     spinner_friendly: true,
#     lake: false,
#     less_than_one_hour: false,
#     one_to_three_hours: true,
#     greater_than_three_hours: false,
#     car_friendly: true,
#     hike_in: true,
#     allows_dogs: true,
#     dogs_off_leash: true,
#     season_spring: true,
#     season_summer: true,
#     season_fall: true,
#     season_winter: true,
#     car_camp: true,
#     backpack_camp: true,
#     fee: true,
#     ice_fishing: true
#   },
#   %{
#     longitude: -105.9929,
#     latitude: 39.8993,
#     name: "test name two",
#     description: "this is a test description two",
#     spinner_friendly: true,
#     lake: false,
#     less_than_one_hour: false,
#     one_to_three_hours: true,
#     greater_than_three_hours: false,
#     car_friendly: true,
#     hike_in: true,
#     allows_dogs: true,
#     dogs_off_leash: true,
#     season_spring: true,
#     season_summer: true,
#     season_fall: true,
#     season_winter: true,
#     car_camp: true,
#     backpack_camp: true,
#     fee: true,
#     ice_fishing: true
#   },
#   %{
#     longitude: -104.929,
#     latitude: 38.8763,
#     name: "test name three",
#     description: "this is a test description three",
#     spinner_friendly: true,
#     lake: false,
#     less_than_one_hour: false,
#     one_to_three_hours: true,
#     greater_than_three_hours: false,
#     car_friendly: true,
#     hike_in: true,
#     allows_dogs: true,
#     dogs_off_leash: true,
#     season_spring: true,
#     season_summer: true,
#     season_fall: true,
#     season_winter: true,
#     car_camp: true,
#     backpack_camp: true,
#     fee: true,
#     ice_fishing: true
#   }
# ]

# Enum.each(destination_data, fn destination ->
#   Atlas.Mapping.create_destination(destination)
# end)

# Atlas.Mapping.create_destination(%{
#   longitude: -104.929,
#   latitude: 38.8763,
#   name: "test name three",
#   description: "this is a test description three",
#   spinner_friendly: true,
#   lake: false,
#   less_than_one_hour: false,
#   one_to_three_hours: true,
#   greater_than_three_hours: false,
#   car_friendly: true,
#   hike_in: true,
#   allows_dogs: true,
#   dogs_off_leash: true,
#   season_spring: true,
#   season_summer: true,
#   season_fall: true,
#   season_winter: true,
#   car_camp: true,
#   backpack_camp: true,
#   fee: true,
#   ice_fishing: true
# })
