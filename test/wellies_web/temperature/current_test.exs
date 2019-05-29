defmodule WelliesWeb.CurrentTemperatureTest do
  use WelliesWeb.ConnCase
  alias WelliesWeb.CurrentTemperature

  test "get current temperature from mock api" do
    london = "012345"
    assert CurrentTemperature.request_current_weather(london) ==
    {:ok, %Current{city: "London", country: "GB", icon: "http://openweathermap.org/img/w/01d.png", max: 18.89, min: 14.44, temperature: 16.67}}
  end
end
