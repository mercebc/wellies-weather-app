defmodule WelliesWeb.WeatherRequestApiTest do
  use WelliesWeb.ConnCase
  alias WelliesWeb.OpenWeatherApi
  alias WelliesWeb.ResponseHandler

  test "request 12h weather in london and get success response" do
    london_id = 2643743
    response = OpenWeatherApi.hourly_in(london_id)
    assert ResponseHandler.get_status_line(response) == {'HTTP/1.1', 200, 'OK'}
  end

  test "request 5 days weather in london and get success response" do
    london_id = 2643743
    response = OpenWeatherApi.next_5_days_in(london_id)
    assert ResponseHandler.get_status_line(response) == {'HTTP/1.1', 200, 'OK'}
  end

end
