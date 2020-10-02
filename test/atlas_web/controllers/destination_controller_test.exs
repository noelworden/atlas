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

  describe "index" do
    test "lists unfiltered destinations", %{conn: conn} do
      conn = get(conn, Routes.destination_path(conn, :index, filter: :none))
      assert html_response(conn, 200) =~ "All Destinations"
    end

    test "lists spring filtered destinations", %{conn: conn} do
      conn = get(conn, Routes.destination_path(conn, :index, filter: :spring))
      assert html_response(conn, 200) =~ "All Spring Destinations"
    end

    test "lists summer filtered destinations", %{conn: conn} do
      conn = get(conn, Routes.destination_path(conn, :index, filter: :summer))
      assert html_response(conn, 200) =~ "All Summer Destinations"
    end

    test "lists fall filtered destinations", %{conn: conn} do
      conn = get(conn, Routes.destination_path(conn, :index, filter: :fall))
      assert html_response(conn, 200) =~ "All Fall Destinations"
    end

    test "lists winter filtered destinations", %{conn: conn} do
      conn = get(conn, Routes.destination_path(conn, :index, filter: :winter))
      assert html_response(conn, 200) =~ "All Winter Destinations"
    end

    test "lists ice fishing filtered destinations", %{conn: conn} do
      conn = get(conn, Routes.destination_path(conn, :index, filter: :ice))
      assert html_response(conn, 200) =~ "All Ice Fishing Destinations"
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
      assert redirected_to(conn) == Routes.destination_path(conn, :index)

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
