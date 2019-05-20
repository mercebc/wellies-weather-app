defmodule WelliesWeb.HTTPClientStub do
  @behaviour HTTPClientBehaviour

  def get_endpoint(url) do
    url
    |> to_string
    |> String.split("?")
    |> List.first()
    |> String.split("2.5")
    |> List.last()
  end

  def get_city(url) do
    url
    |> to_string
    |> String.split("&units")
    |> List.first()
    |> String.split("q=")
    |> List.last()
  end

  def get(url) do
    url
    |> get_city
    |> case do
      "London" -> response(url)
      "Paris" -> response(url)
      "New+York" -> response(url)
      _ -> not_found()
    end
  end

  def response(url) do
    url
    |> get_endpoint
    |> case do
      "/forecast/hourly" -> response_hourly()
      "/forecast" -> response_5d()
    end
  end


  def response_hourly do
    {:ok,
     {{'HTTP/1.1', 200, 'OK'}, [{'connection', 'keep-alive'}],
      '{"cod":"200","message":0.0094,"list":[
        {"main":{"temp":19.64},"weather":[{"description":"clear sky","icon":"01d"}],"dt_txt":"2019-05-15 12:00:00"},
        {"main":{"temp":14.67},"weather":[{"description":"clear sky","icon":"01d"}],"dt_txt":"2019-05-15 13:00:00"},
        {"main":{"temp":20.43},"weather":[{"description":"clear sky","icon":"01d"}],"dt_txt":"2019-05-15 14:00:00"},
        {"main":{"temp":24.06},"weather":[{"description":"clear sky","icon":"01d"}],"dt_txt":"2019-05-15 15:00:00"}
        ]}'}}
  end

  def response_5d do
    {:ok,
     {{'HTTP/1.1', 200, 'OK'}, [{'connection', 'keep-alive'}],
      '{"cod":"200","message":0.0094,"list":[
        {"main":{"temp":19.64},"weather":[{"description":"clear sky","icon":"01d"}],"dt_txt":"2019-05-15 12:00:00"},
        {"main":{"temp":14.67},"weather":[{"description":"clear sky","icon":"01d"}],"dt_txt":"2019-05-15 15:00:00"},
        {"main":{"temp":18.44},"weather":[{"description":"clear sky","icon":"01d"}],"dt_txt":"2019-05-15 18:00:00"},
        {"main":{"temp":20.43},"weather":[{"description":"clear sky","icon":"01d"}],"dt_txt":"2019-05-16 12:00:00"},
        {"main":{"temp":24.06},"weather":[{"description":"clear sky","icon":"01d"}],"dt_txt":"2019-05-16 15:00:00"},
        {"main":{"temp":20.43},"weather":[{"description":"clear sky","icon":"01d"}],"dt_txt":"2019-05-17 12:00:00"},
        {"main":{"temp":20.43},"weather":[{"description":"clear sky","icon":"01d"}],"dt_txt":"2019-05-17 12:00:00"},
        {"main":{"temp":20.43},"weather":[{"description":"clear sky","icon":"01d"}],"dt_txt":"2019-05-18 12:00:00"},
        {"main":{"temp":24.06},"weather":[{"description":"clear sky","icon":"01d"}],"dt_txt":"2019-05-18 15:00:00"},
        {"main":{"temp":24.06},"weather":[{"description":"clear sky","icon":"01d"}],"dt_txt":"2019-05-19 15:00:00"},
        {"main":{"temp":24.06},"weather":[{"description":"clear sky","icon":"01d"}],"dt_txt":"2019-05-20 15:00:00"}
        ]}'}}
  end

  def not_found do
    {:ok, {{'HTTP/1.1', 404, 'Not Found'}, [{'connection', 'keep-alive'}],
      'City not found'}}
  end

end