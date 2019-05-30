defmodule WelliesWeb.OpenWeatherParser do
  def get_hourly_weather(body) do
    body
    |> get_weather_list()
    |> Enum.take(9)
    |> group_by_date()
  end

  def temperatures_grouped_by_date(body) do
    body
    |> get_weather_list()
    |> clean_date_field()
    |> group_by_date()
  end

  defp get_weather_list(body), do: Map.get(body, "list")

  defp clean_date_field(element), do: Enum.map(element, fn x -> update_date(x) end)

  defp group_by_date(element), do: Enum.group_by(element, fn x -> date_field(x) end)

  defp update_date(element),
    do: Map.update!(element, "dt_txt", fn x -> get_date_from_datefield(x) end)

  defp date_field(element), do: Map.get(element, "dt_txt")

  def temperature_field(element), do: element["main"]["temp"]

  def temperature_max_field(element), do: element["main"]["temp_max"]

  def temperature_min_field(element), do: element["main"]["temp_min"]

  def icon_url(element) do
    element
    |> Map.get("weather")
    |> List.first()
    |> Map.get("icon")
    |> build_icon_url
  end

  defp build_icon_url(icon) do
    ~s(http://openweathermap.org/img/w/#{icon}.png)
  end

  defp get_date_from_datefield(datefield) do
    datefield
    |> String.split()
    |> List.first()
  end

  defp get_hour_from_datefield(datefield) do
    datefield
    |> String.split()
    |> List.last()
  end

  def get_date(element) do
    element
    |> date_field
    |> get_date_from_datefield
  end

  def get_hour(element) do
    element
    |> date_field
    |> get_hour_from_datefield
  end

  def city(element) do
    element
    |> Map.get("name")
  end

  def country(element) do
    element
    |> Map.get("sys")
    |> Map.get("country")
  end
end
