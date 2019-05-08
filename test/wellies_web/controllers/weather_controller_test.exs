defmodule WelliesWeb.WeatherControllerTest do
  use WelliesWeb.ConnCase
  import WelliesWeb.WeatherController

  # test "GET /weather/328328", %{conn: conn} do
  #   conn = get(conn, "/weather/328328")
  #   assert html_response(conn, 200) =~ "Weather in London"
  # end

  test "request 12h weather in london and get success response" do
     response = request_12h_weather_in(328328)
     response = elem(response, 1)
     status_line = elem(response, 0)
     assert status_line == {'HTTP/1.1', 200, 'OK'}
  end

  test "Builds the url" do
    id = 328328
    url = url_builder("http://dataservice.accuweather.com/", "forecasts/v1/hourly/12hour/", id, "apikey=1234")
    assert url == 'http://dataservice.accuweather.com/forecasts/v1/hourly/12hour/328328?apikey=1234'
  end

  test "request 12h weather in london and get temperature" do
     response = request_12h_weather_in(328328)
     body = get_body(response)
     assert body == {'http/1.1', 200, 'ok'}
  end

end
