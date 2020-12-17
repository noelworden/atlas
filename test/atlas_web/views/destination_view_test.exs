defmodule AtlasWeb.DestinationViewTest do
  use AtlasWeb.ConnCase, async: true

  alias AtlasWeb.DestinationView

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

  describe "title_divider/2 returns correct string" do
    test "returns '' if both arguments are ''" do
      assert DestinationView.title_divider("", "") == ""
    end

    test "returns '' if second argument is ''" do
      assert DestinationView.title_divider("none", "") == ""
    end

    test "returns '' if first argument is ''" do
      assert DestinationView.title_divider("", true) == ""
    end

    test "returns ' / ' if neither of the arguments are ''" do
      assert DestinationView.title_divider("spring", false) == " / "
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
