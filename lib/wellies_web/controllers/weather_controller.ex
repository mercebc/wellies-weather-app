defmodule WelliesWeb.WeatherController do
  use WelliesWeb, :controller
  alias WelliesWeb.CurrentTemperature
  alias WelliesWeb.FiveDaysTemperature

  def weather(conn, %{"id" => id} = _params) do
    with {:ok, current} <- CurrentTemperature.request_current_weather(id),
         {:ok, five_days} <- FiveDaysTemperature.request_five_days_forecast(id)
    do
      render_weather(conn, current, five_days)
    else
      {:error, _} -> render_error(conn)
    end
  end

  def render_weather(conn, current, five_days) do
    render(conn, "weather.html",
      current: current,
      five_days: five_days
    )
  end

  def render_error(conn) do
    render(conn, "not_found.html")
  end
end
