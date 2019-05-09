defmodule WelliesWeb.HourlyTemperature do
  import WelliesWeb.WeatherApiRequest
  import WelliesWeb.ResponseHandler

  def get_current_temperature(id) do
    response = hourly_in(id)
    body = get_body(response)
    get_temperature_from(body)
  end

  def get_temperature_from(body) do
    weather = body["list"]
    weather_now = List.first(weather)
    weather_now["main"]["temp"]
  end

end
