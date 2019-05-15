defmodule ForecastNow do
  defstruct [:date, :hour, :temperature]
end

defmodule WelliesWeb.CurrentTemperature do
  alias WelliesWeb.ResponseHandler
  alias WelliesWeb.OpenWeatherParser
  alias WelliesWeb.OpenWeatherApi

  def request_current_forecast(id) do
    id
    |> OpenWeatherApi.hourly_in
    |> ResponseHandler.get_body
    |> get_temperature
  end

  defp get_temperature(body) do
     body
     |> OpenWeatherParser.get_current_forecast
     |> new_forecast
  end

  defp new_forecast(element) do
    %ForecastNow{
      date: OpenWeatherParser.get_date(element),
      hour: OpenWeatherParser.get_hour(element),
      temperature: OpenWeatherParser.temperature_field(element)
    }
  end

end
