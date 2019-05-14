defmodule WelliesWeb.FiveDaysTemperatureTest do
  use WelliesWeb.ConnCase
  import WelliesWeb.FiveDaysTemperature

  test "gets the date from a date-time" do
    long_date = "2019-05-19 00:00:00"
    assert get_short_date(long_date) == "2019-05-19"
  end

  test "updates date field from a map" do
    map = %{"clouds" => %{"all" => 45},
     "dt" => 1558245600,
     "dt_txt" => "2019-05-19 00:00:00"
    }
    assert update_date(map) == %{"clouds" => %{"all" => 45},
     "dt" => 1558245600,
     "dt_txt" => "2019-05-19"
    }
  end

  test "cleans date from a list of maps" do
    forecast =[%{"clouds" => %{"all" => 45},
     "dt" => 1558245600,
     "dt_txt" => "2019-05-19 03:00:00"
    }, %{"clouds" => %{"all" => 45},
     "dt" => 1558245600,
     "dt_txt" => "2019-05-19 00:00:00"
    }]
    clean_date_forecast =[%{"clouds" => %{"all" => 45},
     "dt" => 1558245600,
     "dt_txt" => "2019-05-19"
    }, %{"clouds" => %{"all" => 45},
     "dt" => 1558245600,
     "dt_txt" => "2019-05-19"
    }]
    assert clean_date_field(forecast) == clean_date_forecast
  end

  test "groups forecast by date" do
    forecast =[%{"clouds" => %{"all" => 45},
     "dt" => 1558245600,
     "dt_txt" => "2019-05-19"
    }, %{"clouds" => %{"all" => 45},
     "dt" => 1558245600,
     "dt_txt" => "2019-05-19"
    }, %{"clouds" => %{"all" => 45},
     "dt" => 1558245600,
     "dt_txt" => "2019-05-18"
    }]
    grouped_by_date_forecast =
      %{"2019-05-18" => [
          %{
            "clouds" => %{"all" => 45},
            "dt" => 1558245600,
            "dt_txt" => "2019-05-18"
          }
        ],
        "2019-05-19" => [
          %{
            "clouds" => %{"all" => 45},
            "dt" => 1558245600,
            "dt_txt" => "2019-05-19"
          },
          %{
            "clouds" => %{"all" => 45},
            "dt" => 1558245600,
            "dt_txt" => "2019-05-19"
          }
      ]}
    assert group_by_date(forecast) == grouped_by_date_forecast
  end

  test "gets the highest and lowest temperature for each day" do
    forecast = %{"2019-05-18" => [
          %{
            "dt_txt" => "2019-05-18",
            "main" => %{ "temp" => 23}
          },
          %{
            "dt_txt" => "2019-05-18",
            "main" => %{ "temp" => 25}
          },
          %{
            "dt_txt" => "2019-05-18",
            "main" => %{ "temp" => 27}
          }
        ],
        "2019-05-19" => [
          %{
            "dt_txt" => "2019-05-18",
            "main" => %{ "temp" => 24}
          },
          %{
            "dt_txt" => "2019-05-18",
            "main" => %{ "temp" => 22}
          }
        ]
      }
    highest_lowest_temperatures = [{"2019-05-18", 23, 27}, {"2019-05-19", 22, 24}]
    assert highest_and_lowest_temperature(forecast) == highest_lowest_temperatures
  end


end
