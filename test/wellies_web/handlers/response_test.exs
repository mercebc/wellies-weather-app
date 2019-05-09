 defmodule WelliesWeb.ResponseHandlerTest do
  use WelliesWeb.ConnCase
  import WelliesWeb.ResponseHandler

  test "gets the body of the response" do
    response = {:ok,
                {{'HTTP/1.1', 200, 'OK'},
                [{'connection', 'keep-alive'}], '[{"temp":14.12,"temp_min":14.12,"temp_max":15.11}]'
               }}
    assert get_body(response) == [%{"temp" => 14.12, "temp_max" => 15.11, "temp_min" => 14.12}]
  end

  test "gets the status line of the response" do
    response = {:ok,
                {{'HTTP/1.1', 200, 'OK'},
                [{'connection', 'keep-alive'}], '[{"temp":14.12,"temp_min":14.12,"temp_max":15.11}]'
               }}
    assert get_status_line(response) == {'HTTP/1.1', 200, 'OK'}
  end

end
