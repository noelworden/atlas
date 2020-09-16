defmodule Atlas.Mapping.Destination do
  @moduledoc """
  Destination contains all the data for a particular fishing location
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "destinations" do
    field :allows_dogs, :boolean, default: false
    field :backpack_camp, :boolean, default: false
    field :car_camp, :boolean, default: false
    field :car_friendly, :boolean, default: false
    field :description, :string
    field :dogs_off_leash, :boolean, default: false
    field :fee, :boolean, default: false
    field :greater_than_three_hours, :boolean, default: false
    field :hike_in, :boolean, default: false
    field :ice_fishing, :boolean, default: false
    field :lake, :boolean, default: false
    field :latitude, :decimal
    field :less_than_one_hour, :boolean, default: false
    field :longitude, :decimal
    field :name, :string
    field :one_to_three_hours, :boolean, default: false
    field :season_fall, :boolean, default: false
    field :season_spring, :boolean, default: false
    field :season_summer, :boolean, default: false
    field :season_winter, :boolean, default: false
    field :spinner_friendly, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(destination, attrs) do
    destination
    |> cast(attrs, [
      :longitude,
      :latitude,
      :name,
      :description,
      :spinner_friendly,
      :lake,
      :less_than_one_hour,
      :one_to_three_hours,
      :greater_than_three_hours,
      :car_friendly,
      :hike_in,
      :allows_dogs,
      :dogs_off_leash,
      :season_spring,
      :season_summer,
      :season_fall,
      :season_winter,
      :car_camp,
      :backpack_camp,
      :fee,
      :ice_fishing
    ])
    |> validate_required([
      :longitude,
      :latitude,
      :name,
      :description,
      :spinner_friendly,
      :lake,
      :less_than_one_hour,
      :one_to_three_hours,
      :greater_than_three_hours,
      :car_friendly,
      :hike_in,
      :allows_dogs,
      :dogs_off_leash,
      :season_spring,
      :season_summer,
      :season_fall,
      :season_winter,
      :car_camp,
      :backpack_camp,
      :fee,
      :ice_fishing
    ])
  end
end
