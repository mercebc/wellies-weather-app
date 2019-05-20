defmodule WelliesWeb.FiveDaysTemperatureTest do
  use WelliesWeb.ConnCase
  alias WelliesWeb.FiveDaysTemperature

  test "gets the highest and lowest temperatures from the mock api" do
    london = "London"

    highest_lowest_temperatures =
      {:ok,
       [
         %Forecast{date: "2019-05-15", max_temp: 19.64, min_temp: 14.67, icon: "http://openweathermap.org/img/w/01d.png"},
         %Forecast{date: "2019-05-16", max_temp: 24.06, min_temp: 20.43, icon: "http://openweathermap.org/img/w/01d.png"},
         %Forecast{date: "2019-05-17", max_temp: 20.43, min_temp: 20.43, icon: "http://openweathermap.org/img/w/01d.png"},
         %Forecast{date: "2019-05-18", max_temp: 24.06, min_temp: 20.43, icon: "http://openweathermap.org/img/w/01d.png"},
         %Forecast{date: "2019-05-19", max_temp: 24.06, min_temp: 24.06, icon: "http://openweathermap.org/img/w/01d.png"},
         %Forecast{date: "2019-05-20", max_temp: 24.06, min_temp: 24.06, icon: "http://openweathermap.org/img/w/01d.png"}
       ]}

    assert FiveDaysTemperature.request_five_days_forecast(london) == highest_lowest_temperatures
  end
end
