defmodule WelliesWeb.CurrentTemperature do
  alias WelliesWeb.WeatherApiRequest
  alias WelliesWeb.ResponseHandler

  def request_current_forecast(id) do
    id
    |> WeatherApiRequest.hourly_in
    |> ResponseHandler.get_body
    |> get_temperature
  end

  def get_temperature(body) do
     body
     |> Map.get("list")
     |> List.first()
     |> Map.get("main")
     |> Map.get("temp")
  end

end
