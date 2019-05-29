defmodule WelliesWeb.WeatherRequestApiTest do
  use WelliesWeb.ConnCase
  import WelliesWeb.OpenWeatherApi
  alias WelliesWeb.ResponseHandler

  test "request current weather in london and get success response" do
    london = "012345"
    response = current_in(london)
    assert ResponseHandler.get_status_line(response) == {'HTTP/1.1', 200, 'OK'}
  end

  test "request 5 days weather in london and get success response" do
    london = "012345"
    response = next_five_days_in(london)
    assert ResponseHandler.get_status_line(response) == {'HTTP/1.1', 200, 'OK'}
  end

  test "builds the url" do
    london = "012345"
    endpoint = "/forecast"

    assert build_url(london, endpoint) ==
             'https://api.openweathermap.org/data/2.5/forecast?id=012345&units=metric&appid=1234'
  end
end
