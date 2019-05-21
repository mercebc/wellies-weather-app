defmodule WelliesWeb.WeatherRequestApiTest do
  use WelliesWeb.ConnCase
  import WelliesWeb.OpenWeatherApi
  alias WelliesWeb.ResponseHandler

  test "request current weather in london and get success response" do
    london = "London"
    response = current_in(london)
    assert ResponseHandler.get_status_line(response) == {'HTTP/1.1', 200, 'OK'}
  end

  test "request 12h weather in london and get success response" do
    london = "London"
    response = hourly_in(london)
    assert ResponseHandler.get_status_line(response) == {'HTTP/1.1', 200, 'OK'}
  end

  test "request 5 days weather in london and get success response" do
    london = "London"
    response = next_five_days_in(london)
    assert ResponseHandler.get_status_line(response) == {'HTTP/1.1', 200, 'OK'}
  end

  test "builds the url" do
    london = "London"
    endpoint = "/forecast"

    assert build_url(london, endpoint) ==
             'https://api.openweathermap.org/data/2.5/forecast?q=London&units=metric&appid=1234'
  end
end
