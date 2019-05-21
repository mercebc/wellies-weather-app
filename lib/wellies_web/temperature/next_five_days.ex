defmodule Forecast do
  defstruct [:date, :icon, :max_temp, :min_temp]
end

defmodule WelliesWeb.FiveDaysTemperature do
  alias WelliesWeb.ResponseHandler
  alias WelliesWeb.OpenWeatherParser
  alias WelliesWeb.OpenWeatherApi

  def request_five_days_forecast(city) do
    city
    |> ResponseHandler.parse_city()
    |> OpenWeatherApi.next_five_days_in()
    |> ResponseHandler.validate_response()
    |> ResponseHandler.format_body(&get_temperatures/1)
  end

  def get_temperatures(body) do
    body
    |> OpenWeatherParser.temperatures_grouped_by_date()
    |> IO.inspect
    |> create_forecast
  end

  defp create_forecast(list), do: Enum.map(list, fn {date, element} -> new(date, element) end)

  defp new(date, element) do
    %Forecast{
      date: date,
      icon: OpenWeatherParser.icon_url(List.first(element)),
      max_temp: get_temperature(element, &Enum.max_by/2),
      min_temp: get_temperature(element, &Enum.min_by/2)
    }
  end

  defp get_temperature(list, strategy) do
    list
    |> strategy.(fn element -> OpenWeatherParser.temperature_field(element) end)
    |> OpenWeatherParser.temperature_field()
  end
end
