defmodule AtlasWeb.PageController do
  use AtlasWeb, :controller

  alias Atlas.Mapping

  def index(conn, _params) do
    render(conn, "index.html",
      season_options: Mapping.season_options(),
      lake_options: Mapping.lake_options(),
      distance_options: Mapping.distance_options(),
      vehicle_options: Mapping.vehicle_options(),
      dog_options: Mapping.dog_options(),
      hike_options: Mapping.hike_options(),
      camp_options: Mapping.camp_options(),
      fee_options: Mapping.fee_options()
    )
  end
end
