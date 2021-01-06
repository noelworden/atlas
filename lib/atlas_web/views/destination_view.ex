defmodule AtlasWeb.DestinationView do
  use AtlasWeb, :view

  def title_divider("", ""), do: ""
  def title_divider(_, ""), do: ""
  def title_divider("", _), do: ""
  def title_divider(_, _), do: " / "

  def page_title_season(season \\ "") do
    case season do
      "spring" -> "Spring"
      "summer" -> "Summer"
      "fall" -> "Fall"
      "winter" -> "Winter"
      "ice" -> "Ice Fishing"
      _ -> ""
    end
  end

  def page_title_lake(lake) do
    case lake do
      true -> "Lake"
      false -> "River & Stream"
      _ -> ""
    end
  end

  def page_title_distance(distance) do
    case distance do
      "less_than_one" -> "1 Hour or Less"
      "one_to_three" -> "1 - 3 Hour"
      "more_than_three" -> "3+ Hour"
      _ -> ""
    end
  end

  def page_title_vehicle(vehicle) do
    case vehicle do
      true -> "Car"
      false -> "Truck"
      _ -> ""
    end
  end

  def page_title_dog(dog) do
    case dog do
      "off_leash" -> "Off Leash"
      "on_leash" -> "On Leash"
      "no_dog" -> "No Dog"
      _ -> ""
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
    end
  end

  def camp_options(car, backpack) do
    cond do
      car && backpack -> "Car or Backpack"
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
