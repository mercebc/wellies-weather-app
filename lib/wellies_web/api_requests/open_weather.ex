defmodule WelliesWeb.OpenWeatherApi do
  @api_host_url "https://api.openweathermap.org/data/2.5"
  @httpClient Application.get_env(:wellies, :httpClient)
  @api_key Application.get_env(:wellies, :api_key)

  def build_url(city, endpoint) do
    ~s(#{@api_host_url}#{endpoint}?q=#{city}&units=metric&appid=#{@api_key})
    |> String.to_charlist()
  end

  defp make_request(city, endpoint) do
    url = build_url(city, endpoint)
    @httpClient.get(url)
  end

  def hourly_in(city), do: make_request(city, "/forecast/hourly")
  def next_five_days_in(city), do: make_request(city, "/forecast")
  def current_in(city), do: make_request(city, "/weather")
end
