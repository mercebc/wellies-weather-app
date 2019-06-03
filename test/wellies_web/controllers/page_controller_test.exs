defmodule WelliesWeb.PageControllerTest do
  use WelliesWeb.ConnCase, async: true

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Wellies"
  end

  test "renders the search box", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "id='search'"
  end
end
