defmodule WelliesWeb.OpenWeatherApi do
  @api_host_url "https://api.openweathermap.org/data/2.5"
  @httpClient Application.get_env(:wellies, :httpClient)
  @api_key Application.get_env(:wellies, :api_key)

  def build_url(id_city, endpoint) do
    @api_key
    |>IO.inspect
    ~s(#{@api_host_url}#{endpoint}?id=#{id_city}&units=metric&appid=#{@api_key})
    |> String.to_charlist()
  end

  defp make_request(id_city, endpoint) do
    url = build_url(id_city, endpoint)
    @httpClient.get(url)
  end

  def next_five_days_in(id_city), do: make_request(id_city, "/forecast")
  def current_in(id_city), do: make_request(id_city, "/weather")
end
