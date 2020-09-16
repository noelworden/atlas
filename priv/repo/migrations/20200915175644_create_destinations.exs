defmodule Atlas.Repo.Migrations.CreateDestinations do
  use Ecto.Migration

  def change do
    create table(:destinations) do
      add :longitude, :decimal, null: false
      add :latitude, :decimal, null: false
      add :name, :string, null: false
      add :description, :text, null: false
      add :spinner_friendly, :boolean, default: false, null: false
      add :lake, :boolean, default: false, null: false
      add :less_than_one_hour, :boolean, default: false, null: false
      add :one_to_three_hours, :boolean, default: false, null: false
      add :greater_than_three_hours, :boolean, default: false, null: false
      add :car_friendly, :boolean, default: false, null: false
      add :hike_in, :boolean, default: false, null: false
      add :allows_dogs, :boolean, default: false, null: false
      add :dogs_off_leash, :boolean, default: false, null: false
      add :season_spring, :boolean, default: false, null: false
      add :season_summer, :boolean, default: false, null: false
      add :season_fall, :boolean, default: false, null: false
      add :season_winter, :boolean, default: false, null: false
      add :car_camp, :boolean, default: false, null: false
      add :backpack_camp, :boolean, default: false, null: false
      add :fee, :boolean, default: false, null: false
      add :ice_fishing, :boolean, default: false, null: false

      timestamps()
    end
  end
end
