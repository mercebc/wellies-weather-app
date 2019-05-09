defmodule WelliesWeb.WeatherControllerTest do
  use WelliesWeb.ConnCase

  test "GET weather in London", %{conn: conn} do
    conn = get(conn, "/weather/2643743")
    assert html_response(conn, 200) =~ "Weather in London"
  end

end
