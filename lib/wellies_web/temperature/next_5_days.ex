defmodule WelliesWeb.FiveDaysTemperature do

  alias WelliesWeb.ResponseHandler
  alias WelliesWeb.WeatherApiRequest

  defstruct [:max_temp, :min_temp, :date]

  def request_five_days_forecast(id) do
    id
    |> WeatherApiRequest.next_5_days_in()
    |> ResponseHandler.get_body()
    |> get_five_days_high_low_temperature()
  end

  def get_five_days_high_low_temperature(body) do
    body["list"]
    |> clean_date_field()
    |> group_by_date()
    |> highest_and_lowest_temperature()
  end

  def clean_date_field(element), do: Enum.map(element, fn x -> update_date(x) end)

  def update_date(element), do: Map.update!(element, "dt_txt", fn x -> get_short_date(x) end)

  def get_short_date(date) do
    date
    |> String.split
    |> List.first
  end

  def group_by_date(element), do: Enum.group_by(element, fn x -> x["dt_txt"] end)

  def highest_and_lowest_temperature(element), do: Enum.map(element, fn {k, v} -> {k, get_lowest_temperature(v), get_highest_temperature(v)} end)

  def get_lowest_temperature(element), do: Enum.min_by(element, fn x -> x["main"]["temp"] end)["main"]["temp"]

  def get_highest_temperature(element), do: Enum.max_by(element, fn x -> x["main"]["temp"] end)["main"]["temp"]
end
