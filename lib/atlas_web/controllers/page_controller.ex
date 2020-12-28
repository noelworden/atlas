defmodule AtlasWeb.PageController do
  use AtlasWeb, :controller

  alias Atlas.Mapping

  def index(conn, _params) do
    season_options = Mapping.season_options()
    lake_options = Mapping.lake_options()
    distance_options = Mapping.distance_options()

    render(conn, "index.html",
      season_options: season_options,
      lake_options: lake_options,
      distance_options: distance_options
    )
  end
end
