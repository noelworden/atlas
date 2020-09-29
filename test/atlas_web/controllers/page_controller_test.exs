defmodule AtlasWeb.PageControllerTest do
  use AtlasWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Angling Atlas"
  end
end
