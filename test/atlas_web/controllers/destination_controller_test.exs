defmodule AtlasWeb.DestinationControllerTest do
  use AtlasWeb.ConnCase

  alias Atlas.Mapping

  @create_attrs %{
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

  def fixture(:destination) do
    {:ok, destination} = Mapping.create_destination(@create_attrs)
    destination
  end

  setup %{conn: conn} do
    user = %Atlas.Users.User{email: "test@test.com"}
    authed_conn = Pow.Plug.assign_current_user(conn, user, [])

    {:ok, authed_conn: authed_conn}
  end

  describe "index showing with no filtering" do
    test "lists unfiltered destinations", %{authed_conn: authed_conn} do
      conn =
        get(
          authed_conn,
          Routes.destination_path(authed_conn, :index,
            season: "",
            lake: "",
            distance: "",
            vehicle: "",
            dog: "",
            hike: "",
            camp: "",
            fee: ""
          )
        )

      assert html_response(conn, 200) =~
               "<h3>\n  All \n\n\n\n\n\n\n\n\n\n\n\n\n\n Destinations\n</h3>"
    end
  end

  describe "index showing only filtered by season" do
    test "lists spring filtered destinations with no lake params", %{
      authed_conn: authed_connauthed_conn
    } do
      conn =
        get(
          authed_connauthed_conn,
          Routes.destination_path(authed_connauthed_conn, :index,
            season: "spring",
            lake: "",
            distance: "",
            vehicle: "",
            dog: "",
            hike: "",
            camp: "",
            fee: ""
          )
        )

      assert html_response(conn, 200) =~
               "<h3>\n  All Spring\n\n\n\n\n\n\n\n\n\n\n\n\n\n Destinations\n</h3>"
    end

    test "lists summer filtered destinations with no lake params", %{authed_conn: authed_conn} do
      conn =
        get(
          authed_conn,
          Routes.destination_path(authed_conn, :index,
            season: "summer",
            lake: "",
            distance: "",
            vehicle: "",
            dog: "",
            hike: "",
            camp: "",
            fee: ""
          )
        )

      assert html_response(conn, 200) =~
               "<h3>\n  All Summer\n\n\n\n\n\n\n\n\n\n\n\n\n\n Destinations\n</h3>"
    end

    test "lists fall filtered destinations with no lake params", %{authed_conn: authed_conn} do
      conn =
        get(
          authed_conn,
          Routes.destination_path(authed_conn, :index,
            season: "fall",
            lake: "",
            distance: "",
            vehicle: "",
            dog: "",
            hike: "",
            camp: "",
            fee: ""
          )
        )

      assert html_response(conn, 200) =~
               "<h3>\n  All Fall\n\n\n\n\n\n\n\n\n\n\n\n\n\n Destinations\n</h3>"
    end

    test "lists winter filtered destinations with no lake params", %{authed_conn: authed_conn} do
      conn =
        get(
          authed_conn,
          Routes.destination_path(authed_conn, :index,
            season: "winter",
            lake: "",
            distance: "",
            vehicle: "",
            dog: "",
            hike: "",
            camp: "",
            fee: ""
          )
        )

      assert html_response(conn, 200) =~
               "<h3>\n  All Winter\n\n\n\n\n\n\n\n\n\n\n\n\n\n Destinations\n</h3>"
    end

    test "lists ice fishing filtered destinations with no lake params", %{
      authed_conn: authed_conn
    } do
      conn =
        get(
          authed_conn,
          Routes.destination_path(authed_conn, :index,
            season: "ice",
            lake: "",
            distance: "",
            vehicle: "",
            dog: "",
            hike: "",
            camp: "",
            fee: ""
          )
        )

      assert html_response(conn, 200) =~
               "<h3>\n  All Ice Fishing\n\n\n\n\n\n\n\n\n\n\n\n\n\n Destinations\n</h3>"
    end
  end

  describe "index showing only filtered by lake" do
    test "lists lake true filtered destinations with no season params", %{
      authed_conn: authed_conn
    } do
      conn =
        get(
          authed_conn,
          Routes.destination_path(authed_conn, :index,
            season: "",
            lake: true,
            distance: "",
            vehicle: "",
            dog: "",
            hike: "",
            camp: "",
            fee: ""
          )
        )

      assert html_response(conn, 200) =~
               "<h3>\n  All \n\nLake\n\n\n\n\n\n\n\n\n\n\n\n Destinations\n</h3>\n"
    end

    test "lists lake false filtered destinations with no season params", %{
      authed_conn: authed_conn
    } do
      conn =
        get(
          authed_conn,
          Routes.destination_path(authed_conn, :index,
            season: "",
            lake: false,
            distance: "",
            vehicle: "",
            dog: "",
            hike: "",
            camp: "",
            fee: ""
          )
        )

      assert html_response(conn, 200) =~
               "<h3>\n  All \n\nRiver &amp; Stream\n\n\n\n\n\n\n\n\n\n\n\n Destinations\n</h3>"
    end
  end

  describe "index showing only filtered by distance" do
    test "list only destinations that are one hour or less", %{authed_conn: authed_conn} do
      conn =
        get(
          authed_conn,
          Routes.destination_path(authed_conn, :index,
            season: "",
            lake: "",
            distance: "less_than_one",
            vehicle: "",
            dog: "",
            hike: "",
            camp: "",
            fee: ""
          )
        )

      assert html_response(conn, 200) =~
               "<h3>\n  All \n\n\n\n1 Hour or Less\n\n\n\n\n\n\n\n\n\n Destinations\n</h3>"
    end

    test "list only destinations that are one to three hours", %{authed_conn: authed_conn} do
      conn =
        get(
          authed_conn,
          Routes.destination_path(authed_conn, :index,
            season: "",
            lake: "",
            distance: "one_to_three",
            vehicle: "",
            dog: "",
            hike: "",
            camp: "",
            fee: ""
          )
        )

      assert html_response(conn, 200) =~
               "<h3>\n  All \n\n\n\n1 - 3 Hour\n\n\n\n\n\n\n\n\n\n Destinations\n</h3>"
    end

    test "list only destinations that are more than three hours", %{authed_conn: authed_conn} do
      conn =
        get(
          authed_conn,
          Routes.destination_path(authed_conn, :index,
            season: "",
            lake: "",
            distance: "more_than_three",
            vehicle: "",
            dog: "",
            hike: "",
            camp: "",
            fee: ""
          )
        )

      assert html_response(conn, 200) =~
               "<h3>\n  All \n\n\n\n3+ Hour\n\n\n\n\n\n\n\n\n\n Destinations\n</h3>"
    end
  end

  describe "index showing only filtered by vehicle" do
    test "list only destinations that are car friendly", %{authed_conn: authed_conn} do
      conn =
        get(
          authed_conn,
          Routes.destination_path(authed_conn, :index,
            season: "",
            lake: "",
            distance: "",
            vehicle: true,
            dog: "",
            hike: "",
            camp: "",
            fee: ""
          )
        )

      assert html_response(conn, 200) =~
               "<h3>\n  All \n\n\n\n\n\nCar\n\n\n\n\n\n\n\n Destinations\n</h3>"
    end

    test "list only destinations that are not car friendly", %{authed_conn: authed_conn} do
      conn =
        get(
          authed_conn,
          Routes.destination_path(authed_conn, :index,
            season: "",
            lake: "",
            distance: "",
            vehicle: false,
            dog: "",
            hike: "",
            camp: "",
            fee: ""
          )
        )

      assert html_response(conn, 200) =~
               "<h3>\n  All \n\n\n\n\n\nTruck\n\n\n\n\n\n\n\n Destinations\n</h3>"
    end
  end

  describe "index showing only filtered by dog options" do
    test "list only destinations that allow dogs and off leash", %{authed_conn: authed_conn} do
      conn =
        get(
          authed_conn,
          Routes.destination_path(authed_conn, :index,
            season: "",
            lake: "",
            distance: "",
            vehicle: "",
            dog: "off_leash",
            hike: "",
            camp: "",
            fee: ""
          )
        )

      assert html_response(conn, 200) =~
               "<h3>\n  All \n\n\n\n\n\n\n\nOff Leash\n\n\n\n\n\n Destinations\n</h3>"
    end

    test "list only destinations that allow dogs and on leash", %{authed_conn: authed_conn} do
      conn =
        get(
          authed_conn,
          Routes.destination_path(authed_conn, :index,
            season: "",
            lake: "",
            distance: "",
            vehicle: "",
            dog: "on_leash",
            hike: "",
            camp: "",
            fee: ""
          )
        )

      assert html_response(conn, 200) =~
               "<h3>\n  All \n\n\n\n\n\n\n\nOn Leash\n\n\n\n\n\n Destinations\n</h3>"
    end

    test "list only destinations that do not allow dogs", %{authed_conn: authed_conn} do
      conn =
        get(
          authed_conn,
          Routes.destination_path(authed_conn, :index,
            season: "",
            lake: "",
            distance: "",
            vehicle: "",
            dog: "no_dog",
            hike: "",
            camp: "",
            fee: ""
          )
        )

      assert html_response(conn, 200) =~
               "<h3>\n  All \n\n\n\n\n\n\n\nNo Dog\n\n\n\n\n\n Destinations\n</h3>"
    end
  end

  describe "index showing only filtered by hike" do
    test "list only destinations that require hiking", %{authed_conn: authed_conn} do
      conn =
        get(
          authed_conn,
          Routes.destination_path(authed_conn, :index,
            season: "",
            lake: "",
            distance: "",
            vehicle: "",
            dog: "",
            hike: true,
            camp: "",
            fee: ""
          )
        )

      assert html_response(conn, 200) =~
               "<h3>\n  All \n\n\n\n\n\n\n\n\n\nHiking\n\n\n\n Destinations\n</h3>"
    end

    test "list only destinations that do not require hiking", %{authed_conn: authed_conn} do
      conn =
        get(
          authed_conn,
          Routes.destination_path(authed_conn, :index,
            season: "",
            lake: "",
            distance: "",
            vehicle: "",
            dog: "",
            hike: false,
            camp: "",
            fee: ""
          )
        )

      assert html_response(conn, 200) =~
               "<h3>\n  All \n\n\n\n\n\n\n\n\n\nNon - Hiking\n\n\n\n Destinations\n</h3>"
    end
  end

  describe "index showing only filtered by camping" do
    test "list only destinations that have car or backpack camping", %{authed_conn: authed_conn} do
      conn =
        get(
          authed_conn,
          Routes.destination_path(authed_conn, :index,
            season: "",
            lake: "",
            distance: "",
            vehicle: "",
            dog: "",
            hike: "",
            camp: "car_backpack",
            fee: ""
          )
        )

      assert html_response(conn, 200) =~
               "<h3>\n  All \n\n\n\n\n\n\n\n\n\n\n\nCar or Backpack Camping\n\n Destinations\n</h3>"
    end

    test "list only destinations that have car camping", %{authed_conn: authed_conn} do
      conn =
        get(
          authed_conn,
          Routes.destination_path(authed_conn, :index,
            season: "",
            lake: "",
            distance: "",
            vehicle: "",
            dog: "",
            hike: "",
            camp: "car",
            fee: ""
          )
        )

      assert html_response(conn, 200) =~
               "<h3>\n  All \n\n\n\n\n\n\n\n\n\n\n\nCar Camping\n\n Destinations\n</h3>"
    end

    test "list only destinations that have backpack camping", %{authed_conn: authed_conn} do
      conn =
        get(
          authed_conn,
          Routes.destination_path(authed_conn, :index,
            season: "",
            lake: "",
            distance: "",
            vehicle: "",
            dog: "",
            hike: "",
            camp: "backpack",
            fee: ""
          )
        )

      assert html_response(conn, 200) =~
               "<h3>\n  All \n\n\n\n\n\n\n\n\n\n\n\nBackpack Camping\n\n Destinations\n</h3>"
    end

    test "list only destinations that are 'no fee'", %{authed_conn: authed_conn} do
      conn =
        get(
          authed_conn,
          Routes.destination_path(authed_conn, :index,
            season: "",
            lake: "",
            distance: "",
            vehicle: "",
            dog: "",
            hike: "",
            camp: "",
            fee: false
          )
        )

      assert html_response(conn, 200) =~
               "<h3>\n  All \n\n\n\n\n\n\n\n\n\n\n\n\n\nNo Fee Destinations\n</h3>"
    end
  end

  describe "index showing by different filtering options" do
    test "lists all spring filtered, lake true, distance one to three, vehicle true, dog off leash, hike true, car or backpack camping, with fee",
         %{authed_conn: authed_conn} do
      conn =
        get(
          authed_conn,
          Routes.destination_path(authed_conn, :index,
            season: "spring",
            lake: true,
            distance: "one_to_three",
            vehicle: true,
            dog: "off_leash",
            hike: true,
            camp: "car_backpack",
            fee: false
          )
        )

      assert html_response(conn, 200) =~
               "<h3>\n  All Spring\n / \nLake\n / \n1 - 3 Hour\n / \nCar\n / \nOff Leash\n / \nHiking\n / \nCar or Backpack Camping\n / \nNo Fee Destinations\n</h3>"
    end

    test "lists fall filtered, lake false, distance of more than three, vehicle false, no dog, hike false, backpack camping",
         %{authed_conn: authed_conn} do
      conn =
        get(
          authed_conn,
          Routes.destination_path(authed_conn, :index,
            season: "fall",
            lake: false,
            distance: "more_than_three",
            vehicle: false,
            dog: "no_dog",
            hike: false,
            camp: "backpack",
            fee: ""
          )
        )

      assert html_response(conn, 200) =~
               "<h3>\n  All Fall\n / \nRiver &amp; Stream\n / \n3+ Hour\n / \nTruck\n / \nNo Dog\n / \nNon - Hiking\n / \nBackpack Camping\n\n Destinations\n</h3>"
    end

    test "lists summer filtered, vehicle true, car camping",
         %{authed_conn: authed_conn} do
      conn =
        get(
          authed_conn,
          Routes.destination_path(authed_conn, :index,
            season: "summer",
            lake: "",
            distance: "",
            vehicle: true,
            dog: "",
            hike: "",
            camp: "car",
            fee: ""
          )
        )

      assert html_response(conn, 200) =~
               "<h3>\n  All Summer\n / \n\n\n\n\nCar\n / \n\n\n\n\nCar Camping\n\n Destinations\n</h3>"
    end

    test "lists lake true, dog off leash, no fee",
         %{authed_conn: authed_conn} do
      conn =
        get(
          authed_conn,
          Routes.destination_path(authed_conn, :index,
            season: "",
            lake: "true",
            distance: "",
            vehicle: true,
            dog: "off_leash",
            hike: "",
            camp: "",
            fee: false
          )
        )

      assert html_response(conn, 200) =~
               "<h3>\n  All \n\nLake\n / \n\n\nCar\n / \nOff Leash\n / \n\n\n\n\nNo Fee Destinations\n</h3>"
    end
  end

  describe "new destination" do
    test "renders form", %{authed_conn: authed_conn} do
      conn = get(authed_conn, Routes.destination_path(authed_conn, :new))
      assert html_response(conn, 200) =~ "New Destination"
    end
  end

  describe "create destination" do
    test "redirects to show when data is valid", %{authed_conn: authed_conn} do
      conn =
        post(authed_conn, Routes.destination_path(authed_conn, :create),
          destination: @create_attrs
        )

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.destination_path(conn, :show, id)

      conn = get(authed_conn, Routes.destination_path(authed_conn, :show, id))
      assert html_response(conn, 200) =~ @create_attrs.name
    end

    test "renders errors when data is invalid", %{authed_conn: authed_conn} do
      conn =
        post(authed_conn, Routes.destination_path(authed_conn, :create),
          destination: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "New Destination"
    end
  end

  describe "edit destination" do
    setup [:create_destination]

    test "renders form for editing chosen destination", %{
      authed_conn: authed_conn,
      destination: destination
    } do
      conn = get(authed_conn, Routes.destination_path(authed_conn, :edit, destination))
      assert html_response(conn, 200) =~ "Edit Destination"
    end
  end

  describe "update destination" do
    setup [:create_destination]

    test "redirects when data is valid", %{authed_conn: authed_conn, destination: destination} do
      conn =
        put(authed_conn, Routes.destination_path(authed_conn, :update, destination),
          destination: @update_attrs
        )

      assert redirected_to(conn) == Routes.destination_path(conn, :show, destination)

      conn = get(authed_conn, Routes.destination_path(authed_conn, :show, destination))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{
      authed_conn: authed_conn,
      destination: destination
    } do
      conn =
        put(authed_conn, Routes.destination_path(authed_conn, :update, destination),
          destination: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Destination"
    end
  end

  describe "delete destination" do
    setup [:create_destination]

    test "deletes chosen destination", %{authed_conn: authed_conn, destination: destination} do
      conn = delete(authed_conn, Routes.destination_path(authed_conn, :delete, destination))
      assert redirected_to(conn) == "/"

      assert_error_sent 404, fn ->
        get(authed_conn, Routes.destination_path(authed_conn, :show, destination))
      end
    end
  end

  defp create_destination(_) do
    destination = fixture(:destination)
    %{destination: destination}
  end
end
