defmodule WelliesWeb.WeatherApiRequest do

  def hourly_in(id) do
    Application.ensure_all_started(:inets)
    Application.ensure_all_started(:ssl)
    url = url_builder("https://api.openweathermap.org/data/2.5/", "forecast/hourly", "", "id=#{id}&units=metric&appid=#{api_key()}")
    :httpc.request(:get, {url, []}, [], [])
  end

  def url_builder(domain, path, id, qparams) do
    url = Enum.join([domain, path, id, "?", qparams], "")
    String.to_charlist(url)
  end

  def api_key do
    Application.get_env(:wellies, :api_key)
  end

end
