defmodule WelliesWeb.WeatherView do
  use WelliesWeb, :view

  def temperature(conn) do
    case conn.assigns[:hourly] do
      nil -> "noindex,nofollow"
      hourly -> Enum.at(hourly, 0).temperature
    end
  end

  def hourly(conn) do
    case conn.assigns[:hourly] do
      nil -> "noindex,nofollow"
      hourly -> hourly
    end
  end

  def five_days(conn) do
    case conn.assigns[:five_days] do
      nil -> "noindex,nofollow"
      five_days -> five_days
    end
  end

  def city(conn) do
    case conn.assigns[:city] do
      nil -> "noindex,nofollow"
      city -> city
    end
  end

  def forecast_date(conn, day) do
    case conn.assigns[:five_days] do
      nil -> "noindex,nofollow"
      five_days -> Enum.at(five_days, day).date
    end
  end

  def forecast_max_temp(conn, day) do
    case conn.assigns[:five_days] do
      nil -> "noindex,nofollow"
      five_days -> Enum.at(five_days, day).max_temp
    end
  end

  def forecast_min_temp(conn, day) do
    case conn.assigns[:five_days] do
      nil -> "noindex,nofollow"
      five_days -> Enum.at(five_days, day).min_temp
    end
  end
end
