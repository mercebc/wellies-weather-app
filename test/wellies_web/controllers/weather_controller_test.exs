defmodule WelliesWeb.WeatherControllerTest do
  use WelliesWeb.ConnCase

  test "renders the weather in New York", %{conn: conn} do
    conn = get(conn, "/weather?city=New+York")
    assert html_response(conn, 200) =~ "Weather in New York"
  end
end
