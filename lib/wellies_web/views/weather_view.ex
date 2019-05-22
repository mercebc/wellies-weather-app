defmodule WelliesWeb.WeatherView do
  use WelliesWeb, :view

  def current(conn) do
    case conn.assigns[:current] do
      nil -> "noindex,nofollow"
      current -> current
    end
  end

  def five_days(conn) do
    case conn.assigns[:five_days] do
      nil -> "noindex,nofollow"
      five_days -> List.delete_at(five_days, 0)
    end
  end

  def city(conn) do
    case conn.assigns[:city] do
      nil -> "noindex,nofollow"
      city -> city
    end
  end

  def now_temperature(conn) do
    case conn.assigns[:current] do
      nil -> "noindex,nofollow"
      current -> current.temperature
    end
  end

  def now_icon(conn) do
    case conn.assigns[:current] do
      nil -> "noindex,nofollow"
      current -> current.icon
    end
  end

  def now_max(conn) do
    case conn.assigns[:current] do
      nil -> "noindex,nofollow"
      current -> current.max
    end
  end

  def now_min(conn) do
    case conn.assigns[:current] do
      nil -> "noindex,nofollow"
      current -> current.min
    end
  end
end
