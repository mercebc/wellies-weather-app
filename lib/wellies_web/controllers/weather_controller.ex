defmodule WelliesWeb.WeatherController do
  use WelliesWeb, :controller
  import WelliesWeb.HourlyTemperature

  def weather(conn, %{"location_id" => location_id} = _params) do
    temperature = get_current_temperature(location_id)
    render(conn, "weather.html", temperature: temperature)
  end

end
