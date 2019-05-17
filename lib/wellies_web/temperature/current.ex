defmodule ForecastNow do
  defstruct [:date, :hour, :temperature]
end

defmodule WelliesWeb.CurrentTemperature do
  alias WelliesWeb.ResponseHandler
  alias WelliesWeb.OpenWeatherParser
  alias WelliesWeb.OpenWeatherApi

  def request_current_forecast(city) do
    city
    |> ResponseHandler.parse_city
    |> OpenWeatherApi.hourly_in()
    |> ResponseHandler.validate_response
    |> ResponseHandler.format_body(&(get_temperature/1))
  end

  def get_temperature(body) do
    body
    |> OpenWeatherParser.get_current_forecast()
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
