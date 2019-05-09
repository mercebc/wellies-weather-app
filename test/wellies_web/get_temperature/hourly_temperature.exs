defmodule WelliesWeb.HourlyTemperatureTest do
  use WelliesWeb.ConnCase
  import WelliesWeb.HourlyTemperature

  test "gets the current temperature" do
     body = %{ "list" => [%{"main" => %{"temp" => 13.48}, "other" => 3},%{}] }
     assert get_temperature_from(body)  == 13.48
  end

end
