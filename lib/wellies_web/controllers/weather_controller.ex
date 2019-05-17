defmodule WelliesWeb.WeatherController do
  use WelliesWeb, :controller
  alias WelliesWeb.CurrentTemperature
  alias WelliesWeb.FiveDaysTemperature

  def weather(conn, %{"city" => city} = _params) do
    current = CurrentTemperature.request_current_forecast(city)
    five_days = FiveDaysTemperature.request_5d_forecast(city)

    render(conn, "weather.html", city: city, current: current, five_days: five_days)
  end
end
