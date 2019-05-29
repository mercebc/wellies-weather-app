defmodule WelliesWeb.OpenWeatherParserTest do
  use WelliesWeb.ConnCase
  import WelliesWeb.OpenWeatherParser

  test "gets current weather grouped by hours" do
    body = %{
      "cod" => "200",
      "list" => [
        %{
          "dt_txt" => "2019-05-15 12:00:00",
          "main" => %{"temp" => 19.64},
          "weather" => [%{"description" => "clear sky", "icon" => "01d"}]
        },
        %{
          "dt_txt" => "2019-05-15 13:00:00",
          "main" => %{"temp" => 14.67},
          "weather" => [%{"description" => "clear sky", "icon" => "01d"}]
        }
      ],
      "message" => 0.0094
    }

    current_weather = %{
      "2019-05-15 12:00:00" => [
        %{
          "dt_txt" => "2019-05-15 12:00:00",
          "main" => %{"temp" => 19.64},
          "weather" => [%{"description" => "clear sky", "icon" => "01d"}]
        }
      ],
      "2019-05-15 13:00:00" => [
        %{
          "dt_txt" => "2019-05-15 13:00:00",
          "main" => %{"temp" => 14.67},
          "weather" => [%{"description" => "clear sky", "icon" => "01d"}]
        }
      ]
    }

    assert get_hourly_weather(body) == current_weather
  end

  test "gets temperatures grouped by date" do
    body = %{
      "cod" => "200",
      "list" => [
        %{
          "dt_txt" => "2019-05-15 12:00:00",
          "main" => %{"temp" => 19.64},
          "weather" => [%{"description" => "clear sky", "icon" => "01d"}]
        },
        %{
          "dt_txt" => "2019-05-16 13:00:00",
          "main" => %{"temp" => 14.67},
          "weather" => [%{"description" => "clear sky", "icon" => "01d"}]
        },
        %{
          "dt_txt" => "2019-05-16 17:00:00",
          "main" => %{"temp" => 14.67},
          "weather" => [%{"description" => "clear sky", "icon" => "01d"}]
        }
      ],
      "message" => 0.0094
    }

    forecast_grouped_by_date = %{
      "2019-05-15" => [
        %{
          "dt_txt" => "2019-05-15",
          "main" => %{"temp" => 19.64},
          "weather" => [
            %{"description" => "clear sky", "icon" => "01d"}
          ]
        }
      ],
      "2019-05-16" => [
        %{
          "dt_txt" => "2019-05-16",
          "main" => %{"temp" => 14.67},
          "weather" => [
            %{"description" => "clear sky", "icon" => "01d"}
          ]
        },
        %{
          "dt_txt" => "2019-05-16",
          "main" => %{"temp" => 14.67},
          "weather" => [
            %{"description" => "clear sky", "icon" => "01d"}
          ]
        }
      ]
    }

    assert temperatures_grouped_by_date(body) == forecast_grouped_by_date
  end

  test "gets the icon url of a single forecast" do
    single_forecast = %{
      "dt_txt" => "2019-05-15 13:00:00",
      "main" => %{"temp" => 14.67, "temp_max" => 23.45, "temp_min" => 12.30},
      "weather" => [%{"description" => "clear sky", "icon" => "01d"}]
    }

    url = "http://openweathermap.org/img/w/01d.png"
    assert icon_url(single_forecast) == url
  end

  test "gets the temperature of a single forecast" do
    single_forecast = %{
      "dt_txt" => "2019-05-15 13:00:00",
      "main" => %{"temp" => 14.67, "temp_max" => 23.45, "temp_min" => 12.30},
      "weather" => [%{"description" => "clear sky", "icon" => "01d"}]
    }

    temperature = 14.67
    assert temperature_field(single_forecast) == temperature
  end

  test "gets the max temperature of a single forecast" do
    single_forecast = %{
      "dt_txt" => "2019-05-15 13:00:00",
      "main" => %{"temp" => 14.67, "temp_max" => 23.45, "temp_min" => 12.30},
      "weather" => [%{"description" => "clear sky", "icon" => "01d"}]
    }

    temperature = 23.45
    assert temperature_max_field(single_forecast) == temperature
  end

  test "gets the min temperature of a single forecast" do
    single_forecast = %{
      "dt_txt" => "2019-05-15 13:00:00",
      "main" => %{"temp" => 14.67, "temp_max" => 23.45, "temp_min" => 12.30},
      "weather" => [%{"description" => "clear sky", "icon" => "01d"}]
    }

    temperature = 12.30
    assert temperature_min_field(single_forecast) == temperature
  end

  test "gets the date of the forecast" do
    single_forecast = %{
      "dt_txt" => "2019-05-15 13:00:00",
      "main" => %{"temp" => 14.67},
      "weather" => [%{"description" => "clear sky", "icon" => "01d"}]
    }

    date = "2019-05-15"
    assert get_date(single_forecast) == date
  end

  test "gets the hour of the forecast" do
    single_forecast = %{
      "dt_txt" => "2019-05-15 13:00:00",
      "main" => %{"temp" => 14.67},
      "weather" => [%{"description" => "clear sky", "icon" => "01d"}]
    }

    hour = "13:00:00"
    assert get_hour(single_forecast) == hour
  end

  test "gets the city of the forecast" do
    single_forecast = %{
      "name" => "Austin",
      "sys" => %{
        "country" => "US",
      },
      "dt_txt" => "2019-05-15 13:00:00",
      "main" => %{"temp" => 14.67},
      "weather" => [%{"description" => "clear sky", "icon" => "01d"}]
    }

    city = "Austin"
    assert city(single_forecast) == city
  end

  test "gets the country of the forecast" do
    single_forecast = %{
      "name" => "Austin",
      "sys" => %{
        "country" => "US",
      },
      "dt_txt" => "2019-05-15 13:00:00",
      "main" => %{"temp" => 14.67},
      "weather" => [%{"description" => "clear sky", "icon" => "01d"}]
    }

    country = "US"
    assert country(single_forecast) == country
  end
end
