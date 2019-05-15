defmodule WelliesWeb.WeatherController do
  use WelliesWeb, :controller
  alias WelliesWeb.CurrentTemperature
  alias WelliesWeb.FiveDaysTemperature

  def weather(conn, %{"location_id" => location_id} = _params) do
    now = CurrentTemperature.request_current_forecast(location_id)
    five_days = FiveDaysTemperature.request_5d_forecast(location_id)

    temperature = now.temperature
    render(conn, "weather.html", temperature: temperature)
  end

end
