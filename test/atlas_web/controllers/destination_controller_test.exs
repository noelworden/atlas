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

  describe "index showing with no filtering" do
    test "lists unfiltered destinations", %{conn: conn} do
      conn = get(conn, Routes.destination_path(conn, :index, season: "", lake: "", distance: ""))
      assert html_response(conn, 200) =~ "<h1>\n  All \n   Destinations\n</h1>"
    end
  end

  describe "index showing only filtered by season" do
    test "lists spring filtered destinations with no lake params", %{conn: conn} do
      conn =
        get(conn, Routes.destination_path(conn, :index, season: "spring", lake: "", distance: ""))

      assert html_response(conn, 200) =~ "<h1>\n  All Spring\n   Destinations\n</h1>"
    end

    test "lists summer filtered destinations with no lake params", %{conn: conn} do
      conn =
        get(conn, Routes.destination_path(conn, :index, season: "summer", lake: "", distance: ""))

      assert html_response(conn, 200) =~ "<h1>\n  All Summer\n   Destinations\n</h1>"
    end

    test "lists fall filtered destinations with no lake params", %{conn: conn} do
      conn =
        get(conn, Routes.destination_path(conn, :index, season: "fall", lake: "", distance: ""))

      assert html_response(conn, 200) =~ "<h1>\n  All Fall\n   Destinations\n</h1>"
    end

    test "lists winter filtered destinations with no lake params", %{conn: conn} do
      conn =
        get(conn, Routes.destination_path(conn, :index, season: "winter", lake: "", distance: ""))

      assert html_response(conn, 200) =~ "<h1>\n  All Winter\n   Destinations\n</h1>"
    end

    test "lists ice fishing filtered destinations with no lake params", %{conn: conn} do
      conn =
        get(conn, Routes.destination_path(conn, :index, season: "ice", lake: "", distance: ""))

      assert html_response(conn, 200) =~ "<h1>\n  All Ice Fishing\n   Destinations\n</h1>"
    end
  end

  describe "index showing only filtered by lake" do
    test "lists lake true filtered destinations with no season params", %{conn: conn} do
      conn =
        get(conn, Routes.destination_path(conn, :index, season: "", lake: true, distance: ""))

      assert html_response(conn, 200) =~ "<h1>\n  All \nLake   Destinations\n</h1>"
    end

    test "lists lake false filtered destinations with no season params", %{conn: conn} do
      conn =
        get(conn, Routes.destination_path(conn, :index, season: "", lake: false, distance: ""))

      assert html_response(conn, 200) =~ "<h1>\n  All \nRiver &amp; Stream   Destinations\n</h1>"
    end
  end

  describe "index showing only filtered by distance" do
    test "list only destinations that are one hour or less", %{conn: conn} do
      conn =
        get(
          conn,
          Routes.destination_path(conn, :index, season: "", lake: "", distance: "less_than_one")
        )

      assert html_response(conn, 200) =~ "<h1>\n  All \n  1 Hour or Less Destinations\n</h1>"
    end

    test "list only destinations that are one to three hours", %{conn: conn} do
      conn =
        get(
          conn,
          Routes.destination_path(conn, :index, season: "", lake: "", distance: "one_to_three")
        )

      assert html_response(conn, 200) =~ "<h1>\n  All \n  1 - 3 Hour Destinations\n</h1>"
    end

    test "list only destinations that are more than three hours", %{conn: conn} do
      conn =
        get(
          conn,
          Routes.destination_path(conn, :index, season: "", lake: "", distance: "more_than_three")
        )

      assert html_response(conn, 200) =~ "<h1>\n  All \n  3+ Hour Destinations\n</h1>"
    end
  end

  describe "index showing by season, lake, and distance filter" do
    test "lists spring filtered with lake true and distance one to three", %{conn: conn} do
      conn =
        get(
          conn,
          Routes.destination_path(conn, :index,
            season: "spring",
            lake: true,
            distance: "one_to_three"
          )
        )

      assert html_response(conn, 200) =~
               "<h1>\n  All Spring\n / Lake /   1 - 3 Hour Destinations\n</h1>"
    end

    test "lists fall filtered with lake false and distance of more than three", %{conn: conn} do
      conn =
        get(
          conn,
          Routes.destination_path(conn, :index,
            season: "fall",
            lake: false,
            distance: "more_than_three"
          )
        )

      assert html_response(conn, 200) =~
               "<h1>\n  All Fall\n / River &amp; Stream /   3+ Hour Destinations\n</h1>"
    end
  end

  describe "new destination" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.destination_path(conn, :new))
      assert html_response(conn, 200) =~ "New Destination"
    end
  end

  describe "create destination" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.destination_path(conn, :create), destination: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.destination_path(conn, :show, id)

      conn = get(conn, Routes.destination_path(conn, :show, id))
      assert html_response(conn, 200) =~ @create_attrs.name
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.destination_path(conn, :create), destination: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Destination"
    end
  end

  describe "edit destination" do
    setup [:create_destination]

    test "renders form for editing chosen destination", %{
      conn: conn,
      destination: destination
    } do
      conn = get(conn, Routes.destination_path(conn, :edit, destination))
      assert html_response(conn, 200) =~ "Edit Destination"
    end
  end

  describe "update destination" do
    setup [:create_destination]

    test "redirects when data is valid", %{conn: conn, destination: destination} do
      conn =
        put(conn, Routes.destination_path(conn, :update, destination), destination: @update_attrs)

      assert redirected_to(conn) == Routes.destination_path(conn, :show, destination)

      conn = get(conn, Routes.destination_path(conn, :show, destination))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{
      conn: conn,
      destination: destination
    } do
      conn =
        put(conn, Routes.destination_path(conn, :update, destination), destination: @invalid_attrs)

      assert html_response(conn, 200) =~ "Edit Destination"
    end
  end

  describe "delete destination" do
    setup [:create_destination]

    test "deletes chosen destination", %{conn: conn, destination: destination} do
      conn = delete(conn, Routes.destination_path(conn, :delete, destination))
      assert redirected_to(conn) == "/"

      assert_error_sent 404, fn ->
        get(conn, Routes.destination_path(conn, :show, destination))
      end
    end
  end

  defp create_destination(_) do
    destination = fixture(:destination)
    %{destination: destination}
  end
end
