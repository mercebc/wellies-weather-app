defmodule WelliesWeb.OpenWeatherApi do
  @api_host_url "https://api.openweathermap.org/data/2.5/"
  @httpClient Application.get_env(:wellies, :httpClient)
  @api_key Application.get_env(:wellies, :api_key)

  def build_url(id, endpoint) do
    ~s(#{@api_host_url}#{endpoint}?id=#{id}&units=metric&appid=#{@api_key})
    |> String.to_charlist
  end

  def make_request(id, endpoint) do
    url = build_url(id, endpoint)
    @httpClient.get(url)
  end

  def hourly_in(id), do: make_request(id, "forecast/hourly")
  def next_5_days_in(id), do: make_request(id, "forecast")
end
