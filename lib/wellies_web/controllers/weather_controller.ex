defmodule WelliesWeb.WeatherController do
  use WelliesWeb, :controller
  alias WelliesWeb.HourlyTemperature
  alias WelliesWeb.FiveDaysTemperature

  def weather(conn, %{"city" => city} = _params) do
    with {:ok, hourly} <- HourlyTemperature.request_hourly_weather(city),
         {:ok, five_days} <- FiveDaysTemperature.request_five_days_forecast(city) 
    do
      render_weather(conn, city, hourly, five_days)
    else
      {:error, _} -> render_error(conn)
    end
  end

  def render_weather(conn, city, hourly, five_days) do
    render(conn, "weather.html", city: city, hourly: hourly, five_days: five_days)
  end

  def render_error(conn) do
    render(conn, "not_found.html")
  end
end
