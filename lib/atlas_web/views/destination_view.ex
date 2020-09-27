defmodule AtlasWeb.DestinationView do
  use AtlasWeb, :view

  def page_title(filter) do
    case filter do
      "spring" -> "All Spring"
      "summer" -> "All Summer"
      "fall" -> "All Fall"
      "winter" -> "All Winter"
      "ice" -> "All Ice Fishing"
      _ -> "All"
    end
  end

  def display_distance(less_than_one, one_to_three, greater_than_three) do
    cond do
      less_than_one -> "< 1"
      one_to_three -> "1 - 3"
      greater_than_three -> "> 3"
      true -> "N/A"
    end
  end

  def dog_options(allows_dogs, dogs_off_leash) do
    cond do
      allows_dogs && dogs_off_leash -> "Off leash"
      allows_dogs && !dogs_off_leash -> "On leash"
      !allows_dogs -> "No dogs"
      true -> "N/A"
    end
  end

  def camp_options(car, backpack) do
    cond do
      car -> "Car"
      backpack -> "Backpack"
      true -> "None"
    end
  end

  def vehicle_options(car) do
    if car do
      "Car"
    else
      "Truck"
    end
  end
end
