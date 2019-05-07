defmodule WelliesWeb.WeatherController do
  use WelliesWeb, :controller

  def weather(conn, %{"location" => location} = _params) do
    render(conn, "weather.html", location: location)
  end

end
