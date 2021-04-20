defmodule AtlasWeb.PageControllerTest do
  use AtlasWeb.ConnCase

  setup %{conn: conn} do
    user = %Atlas.Users.User{email: "test@test.com"}
    authed_conn = Pow.Plug.assign_current_user(conn, user, [])

    {:ok, authed_conn: authed_conn}
  end

  test "GET /", %{authed_conn: authed_conn} do
    conn = get(authed_conn, "/")
    assert html_response(conn, 200) =~ "Angling Atlas"
  end
end
