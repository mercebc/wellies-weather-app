defmodule WelliesWeb.HourlyTemperatureTest do
  use WelliesWeb.ConnCase
  alias WelliesWeb.CurrentTemperature

  test "get current temperature from mock api" do
    london = "London"

    assert CurrentTemperature.request_current_forecast(london) ==
             {:ok,
              %ForecastNow{
                date: "2019-05-15",
                hour: "12:00:00",
                temperature: 19.64
              }}
  end
end
