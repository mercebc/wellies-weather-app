defmodule WelliesWeb.WeatherView do
  use WelliesWeb, :view

  def temperature(conn) do
    case conn.assigns[:temperature] do
      nil -> "NOINDEX,NOFOLLOW"
      temperature -> temperature
    end
  end
end
