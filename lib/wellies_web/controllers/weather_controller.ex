defmodule WelliesWeb.WeatherController do
  use WelliesWeb, :controller
  alias WelliesWeb.CurrentTemperature
  alias WelliesWeb.FiveDaysTemperature
  alias WelliesWeb.ResponseHandler

  def weather(conn, %{"city" => city} = _params) do
    current = CurrentTemperature.request_current_forecast(city)
    five_days = FiveDaysTemperature.request_five_days_forecast(city)

    output = {conn, city, current, five_days}

    case output do
      {conn, city, {:ok, current}, {:ok, five_days}} -> render_weather(conn, city, current, five_days)
      {conn,  _ , _ , _ } -> render_error(conn)
    end

  end

  def render_weather(conn, city, current, five_days) do
    render(conn, "weather.html", city: city, current: current, five_days: five_days)
  end

  def render_error(conn) do
    render(conn, "not_found.html")
  end
end
