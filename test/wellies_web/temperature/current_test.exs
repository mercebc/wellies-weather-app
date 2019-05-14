defmodule WelliesWeb.HourlyTemperatureTest do
  use WelliesWeb.ConnCase
  alias WelliesWeb.CurrentTemperature

  test "gets the current temperature" do
     body = %{ "list" => [%{"main" => %{"temp" => 13.48}, "other" => 3},%{}] }
     assert CurrentTemperature.get_temperature(body)  == 13.48
  end

end
