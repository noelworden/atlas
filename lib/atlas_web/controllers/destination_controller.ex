defmodule AtlasWeb.DestinationController do
  use AtlasWeb, :controller

  alias Atlas.Mapping
  alias Atlas.Mapping.Destination

  def index(conn, %{
        "season" => season,
        "lake" => lake,
        "distance" => distance,
        "vehicle" => vehicle,
        "dog" => dog,
        "hike" => hike,
        "camp" => camp
      }) do
    converted_lake = Mapping.string_to_boolean(lake)
    converted_vehicle = Mapping.string_to_boolean(vehicle)
    converted_hike = Mapping.string_to_boolean(hike)

    destinations =
      Mapping.list_filtered_destinations(
        season,
        converted_lake,
        distance,
        converted_vehicle,
        dog,
        converted_hike,
        camp
      )

    coordinates = Mapping.get_coordinates(destinations)
    names = Mapping.get_names(destinations)
    median_long = Mapping.find_median_coordinates(:longitude, destinations)
    median_lat = Mapping.find_median_coordinates(:latitude, destinations)

    render(conn, "index.html",
      destinations: destinations,
      season: season,
      lake: converted_lake,
      distance: distance,
      vehicle: converted_vehicle,
      dog: dog,
      hike: converted_hike,
      camp: camp,
      coordinates: coordinates,
      names: names,
      median_long: median_long,
      median_lat: median_lat
    )
  end

  def new(conn, _params) do
    changeset = Mapping.change_destination(%Destination{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"destination" => destination_params}) do
    case Mapping.create_destination(destination_params) do
      {:ok, destination} ->
        conn
        |> put_flash(:info, "Destination created successfully.")
        |> redirect(to: Routes.destination_path(conn, :show, destination))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    destination = Mapping.get_destination!(id)
    render(conn, "show.html", destination: destination)
  end

  def edit(conn, %{"id" => id}) do
    destination = Mapping.get_destination!(id)
    changeset = Mapping.change_destination(destination)
    render(conn, "edit.html", destination: destination, changeset: changeset)
  end

  def update(conn, %{"id" => id, "destination" => destination_params}) do
    destination = Mapping.get_destination!(id)

    case Mapping.update_destination(destination, destination_params) do
      {:ok, destination} ->
        conn
        |> put_flash(:info, "Destination updated successfully.")
        |> redirect(to: Routes.destination_path(conn, :show, destination))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", destination: destination, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    destination = Mapping.get_destination!(id)
    {:ok, _destination} = Mapping.delete_destination(destination)

    conn
    |> put_flash(:info, "Destination deleted successfully.")
    |> redirect(to: "/")
  end
end
