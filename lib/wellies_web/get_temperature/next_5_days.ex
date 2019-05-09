defmodule WelliesWeb.FiveDaysTemperature do
  import WelliesWeb.WeatherApiRequest
  import WelliesWeb.ResponseHandler

  def get_five_days_temperature(id) do
    response = next_5_days_in(id)
    body = get_body(response)
    get_five_days_temperature_from(body)
  end

  def get_five_days_temperature_from(body) do
    five_days_weather = body["list"]
                        |> Enum.map(fn element -> element["main"]["temp"] end)
  end

end
