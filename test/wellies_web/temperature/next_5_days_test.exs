defmodule WelliesWeb.FiveDaysTemperatureTest do
  use WelliesWeb.ConnCase
  alias WelliesWeb.FiveDaysTemperature

  test "gets the highest and lowest temperatures from the mock api" do
    id = 1234
    highest_lowest_temperatures = [%Forecast{date: "2019-05-15", max_temp: 19.64, min_temp: 14.67}, %Forecast{date: "2019-05-16", max_temp: 24.06, min_temp: 20.43}]
    assert FiveDaysTemperature.request_5d_forecast(id) == highest_lowest_temperatures
  end

end
