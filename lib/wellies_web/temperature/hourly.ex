defmodule TodayHourly do
  defstruct [:date, :icon, :hour, :temperature]
end

defmodule WelliesWeb.HourlyTemperature do
  alias WelliesWeb.ResponseHandler
  alias WelliesWeb.OpenWeatherParser
  alias WelliesWeb.OpenWeatherApi

  def request_hourly_weather(city) do
    city
    |> ResponseHandler.parse_city()
    |> OpenWeatherApi.hourly_in()
    |> ResponseHandler.validate_response()
    |> IO.inspect
    |> ResponseHandler.format_body(&get_temperature/1)
  end

  def get_temperature(body) do
    body
    |> OpenWeatherParser.get_hourly_weather()
    |> create_forecast
  end

  defp create_forecast(list), do: Enum.map(list, fn {date, element} -> new(date, element) end)

  defp new(date, element) do
    element = List.first(element)

    %TodayHourly{
      date: OpenWeatherParser.get_date(element),
      icon: OpenWeatherParser.icon_url(element),
      hour: OpenWeatherParser.get_hour(element),
      temperature: OpenWeatherParser.temperature_field(element)
    }
  end
end
