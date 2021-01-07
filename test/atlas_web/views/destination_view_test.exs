defmodule AtlasWeb.DestinationViewTest do
  use AtlasWeb.ConnCase, async: true

  alias AtlasWeb.DestinationView

  describe "title_divider/2 returns correct string" do
    test "returns '' if first argument is ''" do
      assert DestinationView.title_divider("", []) == ""
    end

    test "returns '' if second argument is an empty list" do
      assert DestinationView.title_divider("none", []) == ""
    end

    test "returns '' if first argument is a title, and second is an empty list" do
      assert DestinationView.title_divider("No dogs", []) == ""
    end

    test "returns ' / ' if the second argument contains a title" do
      assert DestinationView.title_divider("spring", ["Lake"]) == " / "
    end

    test "returns ' / ' if the second argument contains a title and empty strings" do
      assert DestinationView.title_divider("spring", ["", "", "Lake", ""]) == " / "
    end
  end

  describe "page_title_season/1 returns correct string for filtered season" do
    test "returns 'All Spring' when 'spring' is passed" do
      assert DestinationView.page_title_season("spring") == "Spring"
    end

    test "returns 'All Summer' when 'summer' is passed" do
      assert DestinationView.page_title_season("summer") == "Summer"
    end

    test "returns 'All Fall' when 'fall' is passed" do
      assert DestinationView.page_title_season("fall") == "Fall"
    end

    test "returns 'All Winter' when 'winter' is passed" do
      assert DestinationView.page_title_season("winter") == "Winter"
    end

    test "returns 'All Ice Fishing' when 'ice' is passed" do
      assert DestinationView.page_title_season("ice") == "Ice Fishing"
    end

    test "returns '' when '' is passed" do
      assert DestinationView.page_title_season("") == ""
    end

    test "returns '' when nothing is passed" do
      assert DestinationView.page_title_season() == ""
    end
  end

  describe "page_title_lake/1 returns correct string for filtered lake" do
    test "returns 'Lake' when 'true' is passed" do
      assert DestinationView.page_title_lake(true) == "Lake"
    end

    test "returns 'River & Stream' when 'false' is passed" do
      assert DestinationView.page_title_lake(false) == "River & Stream"
    end

    test "returns '' when '' is passed" do
      assert DestinationView.page_title_lake("") == ""
    end
  end

  describe "page_title_distance/1 returns correct string for filtered distance" do
    test "returns '1 Hour or Less' when 'less_than_one' is passed " do
      assert DestinationView.page_title_distance("less_than_one") == "1 Hour or Less"
    end

    test "returns '1 - 3 Hour' when 'one_to_three' is passed " do
      assert DestinationView.page_title_distance("one_to_three") == "1 - 3 Hour"
    end

    test "returns '3+ Hour' when 'more_than_three' is passed " do
      assert DestinationView.page_title_distance("more_than_three") == "3+ Hour"
    end

    test "returns '' when '' is passed " do
      assert DestinationView.page_title_distance("") == ""
    end
  end

  describe "page_title_vehicle/1 returns correct string for filtered vehicle" do
    test "returns 'Car' when 'true' is passed " do
      assert DestinationView.page_title_vehicle(true) == "Car"
    end

    test "returns 'Truck' when 'false' is passed " do
      assert DestinationView.page_title_vehicle(false) == "Truck"
    end

    test "returns '' when '' is passed " do
      assert DestinationView.page_title_vehicle("") == ""
    end
  end

  describe "page_title_dog/1 returns correct string for filtered dog option" do
    test "returns 'Off Leash' when 'off_leash' is passed " do
      assert DestinationView.page_title_dog("off_leash") == "Off Leash"
    end

    test "returns 'On Leash' when 'on_leash' is passed " do
      assert DestinationView.page_title_dog("on_leash") == "On Leash"
    end

    test "returns 'No Dog' when 'no_dog' is passed " do
      assert DestinationView.page_title_dog("no_dog") == "No Dog"
    end

    test "returns '' when '' is passed " do
      assert DestinationView.page_title_dog("") == ""
    end
  end

  describe "page_title_hike/1 returns correct string for filtered hike option" do
    test "returns 'Hiking' when 'true' is passed " do
      assert DestinationView.page_title_hike(true) == "Hiking"
    end

    test "returns 'Non - Hiking' when 'false' is passed " do
      assert DestinationView.page_title_hike(false) == "Non - Hiking"
    end

    test "returns '' when '' is passed " do
      assert DestinationView.page_title_hike("") == ""
    end
  end

  describe "page_title_camp/1 returns correct string for filtered camp option" do
    test "returns 'Car or Backpack Camping' when 'car_backpack' is passed " do
      assert DestinationView.page_title_camp("car_backpack") == "Car or Backpack Camping"
    end

    test "returns 'Car Camping' when 'car' is passed " do
      assert DestinationView.page_title_camp("car") == "Car Camping"
    end

    test "returns 'Backpack Camping' when 'backpack' is passed " do
      assert DestinationView.page_title_camp("backpack") == "Backpack Camping"
    end

    test "returns '' when '' is passed " do
      assert DestinationView.page_title_camp("") == ""
    end
  end

  describe "page_title_fee/1 returns correct string for filtered hike option" do
    test "returns '' when 'true' is passed " do
      assert DestinationView.page_title_fee(true) == ""
    end

    test "returns 'No Fee' when 'false' is passed " do
      assert DestinationView.page_title_fee(false) == "No Fee"
    end

    test "returns '' when '' is passed " do
      assert DestinationView.page_title_fee("") == ""
    end
  end

  describe "display_distance/3 returns correct string value" do
    test "returns '< 1' when first argument is true" do
      assert DestinationView.display_distance(true, false, false) == "< 1"
    end

    test "returns '1 - 3' when second argument is true" do
      assert DestinationView.display_distance(false, true, false) == "1 - 3"
    end

    test "returns '> 3' when third argument is true" do
      assert DestinationView.display_distance(false, false, true) == "> 3"
    end

    test "returns 'N/A' when all arguments are false" do
      assert DestinationView.display_distance(false, false, false) == "N/A"
    end
  end

  describe "dog_options/2 returns correct string value" do
    test "returns 'Off leash' when both arguments are true" do
      assert DestinationView.dog_options(true, true) == "Off leash"
    end

    test "returns 'On leash' when first argument is true and second is false" do
      assert DestinationView.dog_options(true, false) == "On leash"
    end

    test "returns 'No dogs' when both arguments are false" do
      assert DestinationView.dog_options(false, false) == "No dogs"
    end

    test "returns 'NA' when first argument is false and second is true" do
      assert DestinationView.dog_options(false, true) == "No dogs"
    end
  end

  describe "camp_options/2 returns correct string value" do
    test "returns 'Car' when first argument is true and second is false" do
      assert DestinationView.camp_options(true, false) == "Car"
    end

    test "returns 'Backpack' when first argument is false and second is true" do
      assert DestinationView.camp_options(false, true) == "Backpack"
    end

    test "returns 'Car or Backpack' when first and second arguments are true" do
      assert DestinationView.camp_options(true, true) == "Car or Backpack"
    end

    test "returns 'None' when first and second argument is false" do
      assert DestinationView.camp_options(false, false) == "None"
    end
  end

  describe "vehicle_options/1 returns correct string value" do
    test "returns 'Car' when argument is true" do
      assert DestinationView.vehicle_options(true) == "Car"
    end

    test "returns 'Truck' when argument is false" do
      assert DestinationView.vehicle_options(false) == "Truck"
    end
  end
end
