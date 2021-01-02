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
      description: "single destination description",
      dogs_off_leash: true,
      fee: true,
      greater_than_three_hours: true,
      hike_in: true,
      ice_fishing: true,
      lake: true,
      latitude: "120.5",
      less_than_one_hour: true,
      longitude: "-120.5",
      name: "single destination name",
      one_to_three_hours: true,
      season_fall: true,
      season_spring: true,
      season_summer: true,
      season_winter: true,
      spinner_friendly: true
    }

    @valid_multi_attrs [
      %{
        allows_dogs: true,
        backpack_camp: true,
        car_camp: true,
        car_friendly: true,
        description: "first destination description",
        dogs_off_leash: true,
        fee: true,
        greater_than_three_hours: true,
        hike_in: true,
        ice_fishing: true,
        lake: true,
        latitude: "120.5",
        less_than_one_hour: true,
        longitude: "-120.5",
        name: "first destination",
        one_to_three_hours: true,
        season_fall: true,
        season_spring: true,
        season_summer: true,
        season_winter: true,
        spinner_friendly: true
      },
      %{
        allows_dogs: true,
        backpack_camp: true,
        car_camp: true,
        car_friendly: true,
        description: "second destination description",
        dogs_off_leash: true,
        fee: true,
        greater_than_three_hours: true,
        hike_in: true,
        ice_fishing: true,
        lake: true,
        latitude: "120.4",
        less_than_one_hour: true,
        longitude: "-120.4",
        name: "second destination",
        one_to_three_hours: true,
        season_fall: true,
        season_spring: true,
        season_summer: true,
        season_winter: true,
        spinner_friendly: true
      },
      %{
        allows_dogs: true,
        backpack_camp: true,
        car_camp: true,
        car_friendly: true,
        description: "third destination description",
        dogs_off_leash: true,
        fee: true,
        greater_than_three_hours: true,
        hike_in: true,
        ice_fishing: true,
        lake: true,
        latitude: "120.3",
        less_than_one_hour: true,
        longitude: "-120.3",
        name: "third destination",
        one_to_three_hours: true,
        season_fall: true,
        season_spring: true,
        season_summer: true,
        season_winter: true,
        spinner_friendly: true
      }
    ]

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
      longitude: "-456.7",
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

    def single_destination_fixture(attrs \\ %{}) do
      {:ok, destination} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Mapping.create_destination()

      destination
    end

    def standard_multi_destination_fixture(valid_multi_attrs) do
      Enum.each(valid_multi_attrs, &Mapping.create_destination(&1))
    end

    def custom_multi_destination_fixture(valid_multi_attrs, field, values) do
      Enum.zip(valid_multi_attrs, values)
      |> Enum.each(fn {key, value} ->
        Map.get_and_update(key, field, fn current_value ->
          {current_value, value}
        end)
        |> case do
          {_, result} ->
            Mapping.create_destination(result)

          _ ->
            nil
        end
      end)
    end

    test "returns all unfiltered destinations" do
      standard_multi_destination_fixture(@valid_multi_attrs)
      assert Enum.count(Mapping.list_filtered_destinations("none", "", "")) == 3
    end

    test "list_filtered_destinations/3 returns one spring destination" do
      custom_multi_destination_fixture(@valid_multi_attrs, :season_spring, [true, false, false])
      assert Enum.count(Mapping.list_filtered_destinations("spring", "", "")) == 1
    end

    test "list_filtered_destinations/3 returns one summer destination" do
      custom_multi_destination_fixture(@valid_multi_attrs, :season_summer, [true, false, false])
      assert Enum.count(Mapping.list_filtered_destinations("summer", "", "")) == 1
    end

    test "list_filtered_destinations/3 returns one fall destination" do
      custom_multi_destination_fixture(@valid_multi_attrs, :season_fall, [true, false, false])
      assert Enum.count(Mapping.list_filtered_destinations("fall", "", "")) == 1
    end

    test "list_filtered_destinations/3 returns one winter destination" do
      custom_multi_destination_fixture(@valid_multi_attrs, :season_winter, [true, false, false])
      assert Enum.count(Mapping.list_filtered_destinations("winter", "", "")) == 1
    end

    test "list_filtered_destinations/3 returns one ice destination" do
      custom_multi_destination_fixture(@valid_multi_attrs, :ice_fishing, [true, false, false])
      assert Enum.count(Mapping.list_filtered_destinations("ice", "", "")) == 1
    end

    test "list_filtered_destinations/3 returns two lake destinations" do
      custom_multi_destination_fixture(@valid_multi_attrs, :lake, [true, true, false])
      assert Enum.count(Mapping.list_filtered_destinations("", true, "")) == 2
    end

    test "list_filtered_destinations/3 returns two river & stream destinations" do
      custom_multi_destination_fixture(@valid_multi_attrs, :lake, [true, false, false])
      assert Enum.count(Mapping.list_filtered_destinations("", false, "")) == 2
    end

    test "list_filtered_destinations/3 returns two 'less than one hour' destinations" do
      custom_multi_destination_fixture(@valid_multi_attrs, :less_than_one_hour, [
        true,
        true,
        false
      ])

      assert Enum.count(Mapping.list_filtered_destinations("", "", "less_than_one")) == 2
    end

    test "list_filtered_destinations/3 returns two 'one to three hour' destinations" do
      custom_multi_destination_fixture(@valid_multi_attrs, :one_to_three_hours, [
        true,
        true,
        false
      ])

      assert Enum.count(Mapping.list_filtered_destinations("", "", "one_to_three")) == 2
    end

    test "list_filtered_destinations/3 returns two 'more than three hour' destinations" do
      custom_multi_destination_fixture(@valid_multi_attrs, :greater_than_three_hours, [
        true,
        true,
        false
      ])

      assert Enum.count(Mapping.list_filtered_destinations("", "", "more_than_three")) == 2
    end

    test "get_destination!/1 returns the destination with given id" do
      destination = single_destination_fixture()
      assert Mapping.get_destination!(destination.id) == destination
    end

    test "string_to_boolean/1 returns boolean true from true string" do
      assert Mapping.string_to_boolean("true") == true
    end

    test "string_to_boolean/1 returns boolean false from false string" do
      assert Mapping.string_to_boolean("false") == false
    end

    test "string_to_boolean/1 returns '' if given ''" do
      assert Mapping.string_to_boolean("") == ""
    end

    test "get_coordinates/1 returns string of empty list if no destinations are present" do
      listed_destinations = Mapping.list_filtered_destinations("none", "", "")
      assert Mapping.get_coordinates(listed_destinations) == "[]"
    end

    test "get_coordinates/1 returns long/lat coordinates of single destination" do
      destination = single_destination_fixture()
      listed_destinations = Mapping.list_filtered_destinations("none", "", "")

      assert Mapping.get_coordinates(listed_destinations) ==
               "[[#{destination.longitude},#{destination.latitude}]]"
    end

    test "get_coordinates/1 returns long/lat coordinates of multiple destinations" do
      standard_multi_destination_fixture(@valid_multi_attrs)
      listed_destinations = Mapping.list_filtered_destinations("none", "", "")
      first_destination = Enum.at(listed_destinations, 0)
      second_destination = Enum.at(listed_destinations, 1)
      third_destination = Enum.at(listed_destinations, 2)

      assert Mapping.get_coordinates(listed_destinations) ==
               "[[#{first_destination.longitude},#{first_destination.latitude}],[#{
                 second_destination.longitude
               },#{second_destination.latitude}],[#{third_destination.longitude},#{
                 third_destination.latitude
               }]]"
    end

    test "find_median_coordinates/2 returns default longitude coordinate if no destinations are present" do
      assert Mapping.find_median_coordinates(:longitude, []) == -105.101
    end

    test "find_median_coordinates/2 returns default latitude coordinate if no destinations are present" do
      assert Mapping.find_median_coordinates(:latitude, []) == 40.135
    end

    test "find_median_coordinates/2 returns longitude of single destination" do
      destination = single_destination_fixture()
      listed_destinations = Mapping.list_filtered_destinations("none", "", "")

      assert Mapping.find_median_coordinates(:longitude, listed_destinations) ==
               Decimal.to_float(destination.longitude)
    end

    test "find_median_coordinates/2 returns latitude of single destination" do
      destination = single_destination_fixture()
      listed_destinations = Mapping.list_filtered_destinations("none", "", "")

      assert Mapping.find_median_coordinates(:latitude, listed_destinations) ==
               Decimal.to_float(destination.latitude)
    end

    test "find_median_coordinates/2 returns median longitude of multiple destinations" do
      standard_multi_destination_fixture(@valid_multi_attrs)
      listed_destinations = Mapping.list_filtered_destinations("none", "", "")
      first_destination = Enum.at(listed_destinations, 0)
      second_destination = Enum.at(listed_destinations, 1)
      third_destination = Enum.at(listed_destinations, 2)

      assert Mapping.find_median_coordinates(:longitude, listed_destinations) ==
               Decimal.to_float(
                 Decimal.div(
                   Decimal.add(
                     first_destination.longitude,
                     Decimal.add(second_destination.longitude, third_destination.longitude)
                   ),
                   3
                 )
               )
    end

    test "find_median_coordinates/2 returns median latitude of multiple destinations" do
      standard_multi_destination_fixture(@valid_multi_attrs)
      listed_destinations = Mapping.list_filtered_destinations("none", "", "")
      first_destination = Enum.at(listed_destinations, 0)
      second_destination = Enum.at(listed_destinations, 1)
      third_destination = Enum.at(listed_destinations, 2)

      assert Mapping.find_median_coordinates(:latitude, listed_destinations) ==
               Decimal.to_float(
                 Decimal.div(
                   Decimal.add(
                     first_destination.latitude,
                     Decimal.add(second_destination.latitude, third_destination.latitude)
                   ),
                   3
                 )
               )
    end

    test "get_names/1 returns string of empty list if no destinations are present" do
      listed_destinations = Mapping.list_filtered_destinations("none", "", "")
      assert Mapping.get_names(listed_destinations) == "[]"
    end

    test "get_names/1 returns string of list of single JSON converted name of single destination" do
      destination = single_destination_fixture()
      listed_destinations = Mapping.list_filtered_destinations("none", "", "")
      assert Mapping.get_names(listed_destinations) == "[[\"#{destination.name}\"]]"
    end

    test "get_names/1 returns string of list of JSON converted names of multiple destinations" do
      standard_multi_destination_fixture(@valid_multi_attrs)
      listed_destinations = Mapping.list_filtered_destinations("none", "", "")
      first_destination = Enum.at(listed_destinations, 0)
      second_destination = Enum.at(listed_destinations, 1)
      third_destination = Enum.at(listed_destinations, 2)

      assert Mapping.get_names(listed_destinations) ==
               "[[\"#{first_destination.name}\"],[\"#{second_destination.name}\"],[\"#{
                 third_destination.name
               }\"]]"
    end

    test "create_destination/1 with valid data creates a destination" do
      assert {:ok, %Destination{} = destination} = Mapping.create_destination(@valid_attrs)
      assert destination.allows_dogs == true
      assert destination.backpack_camp == true
      assert destination.car_camp == true
      assert destination.car_friendly == true
      assert destination.description == "single destination description"
      assert destination.dogs_off_leash == true
      assert destination.fee == true
      assert destination.greater_than_three_hours == true
      assert destination.hike_in == true
      assert destination.ice_fishing == true
      assert destination.lake == true
      assert destination.latitude == Decimal.new("120.5")
      assert destination.less_than_one_hour == true
      assert destination.longitude == Decimal.new("-120.5")
      assert destination.name == "single destination name"
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
      destination = single_destination_fixture()

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
      assert destination.longitude == Decimal.new("-456.7")
      assert destination.name == "some updated name"
      assert destination.one_to_three_hours == false
      assert destination.season_fall == false
      assert destination.season_spring == false
      assert destination.season_summer == false
      assert destination.season_winter == false
      assert destination.spinner_friendly == false
    end

    test "update_destination/2 with invalid data returns error changeset" do
      destination = single_destination_fixture()
      assert {:error, %Ecto.Changeset{}} = Mapping.update_destination(destination, @invalid_attrs)
      assert destination == Mapping.get_destination!(destination.id)
    end

    test "delete_destination/1 deletes the destination" do
      destination = single_destination_fixture()
      assert {:ok, %Destination{}} = Mapping.delete_destination(destination)
      assert_raise Ecto.NoResultsError, fn -> Mapping.get_destination!(destination.id) end
    end

    test "change_destination/1 returns a destination changeset" do
      destination = single_destination_fixture()
      assert %Ecto.Changeset{} = Mapping.change_destination(destination)
    end
  end
end
