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
