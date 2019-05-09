defmodule WelliesWeb.FiveDaysTemperatureTest do
  use WelliesWeb.ConnCase
  import WelliesWeb.FiveDaysTemperature

  test "gets the temperature in 5 days" do
     body = %{ "list" => [%{"main" => %{"temp" => 13.48}, "other" => 3},%{"main" => %{"temp" => 17.56}, "other" => 7}] }
     assert get_five_days_temperature_from(body)  == [13.48, 17.56]
  end

end
