defmodule WelliesWeb.WeatherController do
  use WelliesWeb, :controller

  def weather(conn, %{"location_id" => location_id} = _params) do
    temperature = get_current_temp(location_id)
    render(conn, "weather.html", temperature: temperature)
  end

  def get_current_temp(id) do
    response = request_12h_weather_in(id)
    body = get_body(response)
    get_temperature(body)
  end

  def request_12h_weather_in(id) do
    Application.ensure_all_started(:inets)
    Application.ensure_all_started(:ssl)
    # url = url_builder("http://dataservice.accuweather.com/", "forecasts/v1/hourly/12hour/", id, "apikey=#{api_key}&metric=true")
    url = url_builder("https://api.openweathermap.org/data/2.5/", "forecast/hourly", "", "id=#{id}&units=metric&appid=#{api_key()}")
    :httpc.request(:get, {url, []}, [], [])
  end

  def url_builder(domain, path, id, qparams) do
    url = Enum.join([domain, path, id, "?", qparams], "")
    String.to_charlist(url)
  end

  def get_body(response) do
    response = elem(response, 1)
    response = elem(response, 2)
    Jason.decode!(response)
  end

  def get_temperature(body) do
    weather = body["list"]
    weather_now = List.first(weather)
    weather_now["main"]["temp"]
  end

  def api_key do
    Application.get_env(:wellies, :api_key)
  end

end
