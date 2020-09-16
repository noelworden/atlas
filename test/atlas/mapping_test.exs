defmodule Atlas.MappingTest do
  use Atlas.DataCase

  alias Atlas.Mapping

  describe "destinations" do
    alias Atlas.Mapping.Destination

    @valid_attrs %{
      allows_dogs: true,
      backpack_camp: true,
      car_camp: true,
      car_friendly: true,
      description: "some description",
      dogs_off_leash: true,
      fee: true,
      greater_than_three_hours: true,
      hike_in: true,
      ice_fishing: true,
      lake: true,
      latitude: "120.5",
      less_than_one_hour: true,
      longitude: "120.5",
      name: "some name",
      one_to_three_hours: true,
      season_fall: true,
      season_spring: true,
      season_summer: true,
      season_winter: true,
      spinner_friendly: true
    }
    @update_attrs %{
      allows_dogs: false,
      backpack_camp: false,
      car_camp: false,
      car_friendly: false,
      description: "some updated description",
      dogs_off_leash: false,
      fee: false,
      greater_than_three_hours: false,
      hike_in: false,
      ice_fishing: false,
      lake: false,
      latitude: "456.7",
      less_than_one_hour: false,
      longitude: "456.7",
      name: "some updated name",
      one_to_three_hours: false,
      season_fall: false,
      season_spring: false,
      season_summer: false,
      season_winter: false,
      spinner_friendly: false
    }
    @invalid_attrs %{
      allows_dogs: nil,
      backpack_camp: nil,
      car_camp: nil,
      car_friendly: nil,
      description: nil,
      dogs_off_leash: nil,
      fee: nil,
      greater_than_three_hours: nil,
      hike_in: nil,
      ice_fishing: nil,
      lake: nil,
      latitude: nil,
      less_than_one_hour: nil,
      longitude: nil,
      name: nil,
      one_to_three_hours: nil,
      season_fall: nil,
      season_spring: nil,
      season_summer: nil,
      season_winter: nil,
      spinner_friendly: nil
    }

    def destination_fixture(attrs \\ %{}) do
      {:ok, destination} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Mapping.create_destination()

      destination
    end

    test "list_destinations/0 returns all destinations" do
      destination = destination_fixture()
      assert Mapping.list_destinations() == [destination]
    end

    test "get_destination!/1 returns the destination with given id" do
      destination = destination_fixture()
      assert Mapping.get_destination!(destination.id) == destination
    end

    test "create_destination/1 with valid data creates a destination" do
      assert {:ok, %Destination{} = destination} = Mapping.create_destination(@valid_attrs)
      assert destination.allows_dogs == true
      assert destination.backpack_camp == true
      assert destination.car_camp == true
      assert destination.car_friendly == true
      assert destination.description == "some description"
      assert destination.dogs_off_leash == true
      assert destination.fee == true
      assert destination.greater_than_three_hours == true
      assert destination.hike_in == true
      assert destination.ice_fishing == true
      assert destination.lake == true
      assert destination.latitude == Decimal.new("120.5")
      assert destination.less_than_one_hour == true
      assert destination.longitude == Decimal.new("120.5")
      assert destination.name == "some name"
      assert destination.one_to_three_hours == true
      assert destination.season_fall == true
      assert destination.season_spring == true
      assert destination.season_summer == true
      assert destination.season_winter == true
      assert destination.spinner_friendly == true
    end

    test "create_destination/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Mapping.create_destination(@invalid_attrs)
    end

    test "update_destination/2 with valid data updates the destination" do
      destination = destination_fixture()

      assert {:ok, %Destination{} = destination} =
               Mapping.update_destination(destination, @update_attrs)

      assert destination.allows_dogs == false
      assert destination.backpack_camp == false
      assert destination.car_camp == false
      assert destination.car_friendly == false
      assert destination.description == "some updated description"
      assert destination.dogs_off_leash == false
      assert destination.fee == false
      assert destination.greater_than_three_hours == false
      assert destination.hike_in == false
      assert destination.ice_fishing == false
      assert destination.lake == false
      assert destination.latitude == Decimal.new("456.7")
      assert destination.less_than_one_hour == false
      assert destination.longitude == Decimal.new("456.7")
      assert destination.name == "some updated name"
      assert destination.one_to_three_hours == false
      assert destination.season_fall == false
      assert destination.season_spring == false
      assert destination.season_summer == false
      assert destination.season_winter == false
      assert destination.spinner_friendly == false
    end

    test "update_destination/2 with invalid data returns error changeset" do
      destination = destination_fixture()
      assert {:error, %Ecto.Changeset{}} = Mapping.update_destination(destination, @invalid_attrs)
      assert destination == Mapping.get_destination!(destination.id)
    end

    test "delete_destination/1 deletes the destination" do
      destination = destination_fixture()
      assert {:ok, %Destination{}} = Mapping.delete_destination(destination)
      assert_raise Ecto.NoResultsError, fn -> Mapping.get_destination!(destination.id) end
    end

    test "change_destination/1 returns a destination changeset" do
      destination = destination_fixture()
      assert %Ecto.Changeset{} = Mapping.change_destination(destination)
    end
  end
end