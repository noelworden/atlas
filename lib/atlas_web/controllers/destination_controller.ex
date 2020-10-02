defmodule AtlasWeb.DestinationController do
  use AtlasWeb, :controller

  alias Atlas.Mapping
  alias Atlas.Mapping.Destination

  def index(conn, %{"filter" => filter}) do
    destinations = Mapping.list_destinations(filter)
    render(conn, "index.html", destinations: destinations, filter: filter)
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
