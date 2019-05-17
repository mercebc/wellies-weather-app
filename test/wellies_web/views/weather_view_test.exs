defmodule WelliesWeb.WeatherViewTest do
  use WelliesWeb.ConnCase, async: true
  import WelliesWeb.WeatherView

  test "gets the current temperature", %{conn: conn} do
    conn = get(conn, "/weather?city=London")
    assert temperature(conn) == 19.64
  end

  test "gets the city from the url", %{conn: conn} do
    conn = get(conn, "/weather?city=Paris")
    assert city(conn) == "Paris"
  end

  test "gets the first date of the forecast", %{conn: conn} do
    conn = get(conn, "/weather?city=London")
    assert forecast_date(conn, 1) == "2019-05-16"
  end

  test "gets the max temperature for the first day", %{conn: conn} do
    conn = get(conn, "/weather?city=London")
    assert forecast_max_temp(conn, 1) == 24.06
  end

  test "gets the min temperature for the first day", %{conn: conn} do
    conn = get(conn, "/weather?city=London")
    assert forecast_min_temp(conn, 1) == 20.43
  end
end
