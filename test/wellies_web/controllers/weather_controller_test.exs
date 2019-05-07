defmodule WelliesWeb.WeatherControllerTest do
  use WelliesWeb.ConnCase

  test "GET /weather/London", %{conn: conn} do
    conn = get(conn, "/weather/London")
    assert html_response(conn, 200) =~ "Weather in London"
  end

end
