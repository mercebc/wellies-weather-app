defmodule WelliesWeb.WeatherControllerTest do
  use WelliesWeb.ConnCase

  test "renders the weather in New York", %{conn: conn} do
    conn = get(conn, "/weather?id=012345")
    assert html_response(conn, 200) =~ "Weather in London"
  end

  test "renders not found if city not found", %{conn: conn} do
    conn = get(conn, "/weather?id=543210")
    assert html_response(conn, 200) =~ "City not found!"
  end
end
