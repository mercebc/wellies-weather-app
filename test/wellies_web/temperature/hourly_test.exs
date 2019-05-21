defmodule WelliesWeb.HourlyTemperatureTest do
  use WelliesWeb.ConnCase
  alias WelliesWeb.HourlyTemperature

  test "get hourly temperature from mock api" do
    london = "London"

    assert HourlyTemperature.request_hourly_weather(london) ==
             {:ok,
              [
                %TodayHourly{
                  date: "2019-05-15",
                  hour: "12:00:00",
                  icon: "http://openweathermap.org/img/w/01d.png",
                  temperature: 19.64
                },
                %TodayHourly{
                  date: "2019-05-15",
                  hour: "13:00:00",
                  icon: "http://openweathermap.org/img/w/01d.png",
                  temperature: 14.67
                },
                %TodayHourly{
                  date: "2019-05-15",
                  hour: "14:00:00",
                  icon: "http://openweathermap.org/img/w/01d.png",
                  temperature: 20.43
                },
                %TodayHourly{
                  date: "2019-05-15",
                  hour: "15:00:00",
                  icon: "http://openweathermap.org/img/w/01d.png",
                  temperature: 24.06
                }
              ]}
  end
end
