defmodule WelliesWeb.WeatherViewTest do
  use WelliesWeb.ConnCase, async: true
  import WelliesWeb.WeatherView

  test "gets the city from the url", %{conn: conn} do
    conn = get(conn, "/weather?city=Paris")
    assert city(conn) == "Paris"
  end

  test "gets the current temperature", %{conn: conn} do
    conn = get(conn, "/weather?city=London")
    assert now_temperature(conn) == 16.67
  end

  test "gets the first date of the forecast", %{conn: conn} do
    conn = get(conn, "/weather?city=London")
    assert now_icon(conn) == "http://openweathermap.org/img/w/01d.png"
  end

  test "gets the max temperature for the first day", %{conn: conn} do
    conn = get(conn, "/weather?city=London")
    assert now_max(conn) == 18.89
  end

  test "gets the min temperature for the first day", %{conn: conn} do
    conn = get(conn, "/weather?city=London")
    assert now_min(conn) == 14.44
  end
end
