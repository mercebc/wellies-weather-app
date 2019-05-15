defmodule WelliesWeb.OpenWeatherParser do

  def get_current_forecast(body) do
     body
     |> get_weather_list()
     |> List.first()
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

  defp update_date(element), do: Map.update!(element, "dt_txt", fn x -> get_date_from_datefield(x) end)

  defp date_field(element), do: Map.get(element, "dt_txt")

  def temperature_field(element), do: element["main"]["temp"]

  defp get_date_from_datefield(datefield) do
    datefield
    |> String.split
    |> List.first
  end

  def get_date(element) do
    element
    |> date_field
    |> get_date_from_datefield
  end

  def get_hour(element) do
    element
    |> date_field
    |> String.split
    |> List.last
  end

end
