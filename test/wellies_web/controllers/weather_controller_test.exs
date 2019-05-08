defmodule WelliesWeb.WeatherControllerTest do
  use WelliesWeb.ConnCase
  import WelliesWeb.WeatherController

  test "GET weather in London", %{conn: conn} do
    conn = get(conn, "/weather/2643743")
    assert html_response(conn, 200) =~ "Weather in London"
  end

  test "request 12h weather in london and get success response" do
     london_id = 2643743
     response = request_12h_weather_in(london_id)
     response = elem(response, 1)
     status_line = elem(response, 0)
     assert status_line == {'HTTP/1.1', 200, 'OK'}
  end

  test "Builds the url" do
    id = 328328
    url = url_builder("http://dataservice.accuweather.com/", "forecasts/v1/hourly/12hour/", id, "apikey=1234")
    assert url == 'http://dataservice.accuweather.com/forecasts/v1/hourly/12hour/328328?apikey=1234'
  end

  test "gets the current temperature" do
     london_id = 2643743
     body = %{ "list" => [%{"main" => %{"temp" => 13.48}, "other" => 3},%{}] }
     assert get_temperature(body)  == 13.48
  end

end
