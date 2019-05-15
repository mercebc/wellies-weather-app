defmodule Forecast do
  defstruct [:date, :max_temp, :min_temp]
end

defmodule WelliesWeb.FiveDaysTemperature do
  alias WelliesWeb.ResponseHandler
  alias WelliesWeb.OpenWeatherParser
  alias WelliesWeb.OpenWeatherApi

  def request_5d_forecast(id) do
    id
    |> OpenWeatherApi.next_5_days_in()
    |> ResponseHandler.get_body()
    |> get_5d_high_low_temperatures()
  end

  defp get_5d_high_low_temperatures(body) do
    body
    |> OpenWeatherParser.temperatures_grouped_by_date()
    |> create_forecast()
  end

  defp create_forecast(list), do: Enum.map(list, fn {date, element} -> new(date, element) end)

  defp new(date, element) do
    %Forecast{
      date: date,
      max_temp: get_temperature(element, &(Enum.max_by/2)),
      min_temp: get_temperature(element, &(Enum.min_by/2))
    }
  end

  defp get_temperature(list, strategy) do
    list
    |> strategy.(fn element -> OpenWeatherParser.temperature_field(element) end)
    |> OpenWeatherParser.temperature_field()
  end
end
