defmodule Current do
  defstruct [:city, :country, :temperature, :icon, :max, :min]
end

defmodule WelliesWeb.CurrentTemperature do
  alias WelliesWeb.ResponseHandler
  alias WelliesWeb.OpenWeatherParser
  alias WelliesWeb.OpenWeatherApi

  def request_current_weather(city) do
    city
    |> OpenWeatherApi.current_in()
    |> ResponseHandler.validate_response()
    |> ResponseHandler.format_body(&get_temperature/1)
  end

  def get_temperature(body) do
    body
    |> create_forecast
  end

  defp create_forecast(element) do
    %Current{
      city: OpenWeatherParser.city(element),
      country: OpenWeatherParser.country(element),
      temperature: OpenWeatherParser.temperature_field(element),
      icon: OpenWeatherParser.icon_url(element),
      max: OpenWeatherParser.temperature_max_field(element),
      min: OpenWeatherParser.temperature_min_field(element)
    }
  end
end
