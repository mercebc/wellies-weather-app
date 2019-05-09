defmodule WelliesWeb.WeatherRequestApiTest do
  use WelliesWeb.ConnCase
  import WelliesWeb.WeatherApiRequest
  import WelliesWeb.ResponseHandler

  test "request 12h weather in london and get success response" do
    london_id = 2643743
    response = hourly_in(london_id)
    assert get_status_line(response) == {'HTTP/1.1', 200, 'OK'}
  end

  test "request 5 days weather in london and get success response" do
    london_id = 2643743
    response = next_5_days_in(london_id)
    assert get_status_line(response) == {'HTTP/1.1', 200, 'OK'}
  end

  test "Builds the url" do
    id = 328328
    url = url_builder("http://dataservice.accuweather.com/", "forecasts/v1/hourly/12hour/", id, "apikey=1234")
    assert url == 'http://dataservice.accuweather.com/forecasts/v1/hourly/12hour/328328?apikey=1234'
  end

end
