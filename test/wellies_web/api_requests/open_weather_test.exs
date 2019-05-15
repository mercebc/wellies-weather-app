defmodule WelliesWeb.WeatherRequestApiTest do
  use WelliesWeb.ConnCase
  import WelliesWeb.OpenWeatherApi
  alias WelliesWeb.ResponseHandler

  test "request 12h weather in london and get success response" do
    london_id = 2643743
    response = hourly_in(london_id)
    assert ResponseHandler.get_status_line(response) == {'HTTP/1.1', 200, 'OK'}
  end

  test "request 5 days weather in london and get success response" do
    london_id = 2643743
    response = next_5_days_in(london_id)
    assert ResponseHandler.get_status_line(response) == {'HTTP/1.1', 200, 'OK'}
  end

  test "builds the url" do
    london_id = 2643743
    endpoint = "forecast"
    assert build_url(london_id, endpoint) == 'https://api.openweathermap.org/data/2.5/forecast?id=2643743&units=metric&appid=1234'
  end

end
