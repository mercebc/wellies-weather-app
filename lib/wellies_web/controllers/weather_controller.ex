defmodule WelliesWeb.WeatherController do
  use WelliesWeb, :controller

  def weather(conn, %{"id" => id} = _params) do
    response = request_12h_weather_in(id)
    content = get_body(response)
    render(conn, "weather.html", content: content)
  end

  def request_12h_weather_in(id) do
    Application.ensure_all_started(:inets)
    Application.ensure_all_started(:ssl)
    url = url_builder("http://dataservice.accuweather.com/", "forecasts/v1/hourly/12hour/", id, "apikey=#{api_key}&metric=true")
    :httpc.request(:get, {url, []}, [], [])
  end

  def url_builder(domain, path, id, qparams) do
    url = Enum.join([domain, path, id, "?", qparams], "")
    String.to_charlist(url)
  end

  def get_body(response) do
    response = elem(response, 1)
    elem(response, 2)
  end

  def api_key do
    Application.get_env(:wellies, :api_key)
  end

end
