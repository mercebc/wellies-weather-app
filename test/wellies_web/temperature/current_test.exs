defmodule WelliesWeb.HourlyTemperatureTest do
  use WelliesWeb.ConnCase
  alias WelliesWeb.CurrentTemperature

  test "get current temperature from mock api" do
    id = 1234
    assert CurrentTemperature.request_current_forecast(id) == %ForecastNow{ date: "2019-05-15", hour: "12:00:00", temperature: 19.64}
  end

end
