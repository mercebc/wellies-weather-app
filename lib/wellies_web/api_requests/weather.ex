defmodule WelliesWeb.WeatherApiRequest do

  @api_host_url "https://api.openweathermap.org/data/2.5/"

  Application.ensure_all_started(:inets)
  Application.ensure_all_started(:ssl)

  def api_key do
    Application.get_env(:wellies, :api_key)
  end

  def make_request(id, endpoint) do
    url = ~s(#{@api_host_url}#{endpoint}?id=#{id}&units=metric&appid=#{api_key})
                                                                     |> String.to_charlist
    :httpc.request(:get, {url, []}, [], [])
  end

  def hourly_in(id), do: make_request(id, "forecast/hourly")
  def next_5_days_in(id), do: make_request(id, "forecast")
end
