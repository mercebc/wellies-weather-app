defmodule WelliesWeb.WeatherController do
  use WelliesWeb, :controller
  alias WelliesWeb.CurrentTemperature
  alias WelliesWeb.FiveDaysTemperature

  def weather(conn, %{"location_id" => location_id} = _params) do
    temperature = CurrentTemperature.request_current_forecast(location_id)
    five_days = FiveDaysTemperature.request_five_days_forecast(location_id)
                |> IO.inspect
    render(conn, "weather.html", temperature: temperature, five_days: five_days)
  end

end
