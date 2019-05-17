defmodule WelliesWeb.OpenWeatherParserTest do
  use WelliesWeb.ConnCase
  import WelliesWeb.OpenWeatherParser

  test "gets current forecast" do
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

    current_forecast = %{
      "dt_txt" => "2019-05-15 12:00:00",
      "main" => %{"temp" => 19.64},
      "weather" => [%{"description" => "clear sky", "icon" => "01d"}]
    }

    assert get_current_forecast(body) == current_forecast
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

  test "gets the temperature of a single forecast" do
    single_forecast = %{
      "dt_txt" => "2019-05-15 13:00:00",
      "main" => %{"temp" => 14.67},
      "weather" => [%{"description" => "clear sky", "icon" => "01d"}]
    }

    temperature = 14.67
    assert temperature_field(single_forecast) == temperature
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
end
