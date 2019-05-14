defmodule WelliesWeb.WeatherView do
  use WelliesWeb, :view

  def temperature(conn) do
    case conn.assigns[:temperature] do
      nil -> "noindex,nofollow"
      temperature -> temperature
    end
  end
end
