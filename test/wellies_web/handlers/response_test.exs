defmodule WelliesWeb.ResponseHandlerTest do
  use WelliesWeb.ConnCase
  import WelliesWeb.ResponseHandler

  test "gets a valid body of the response" do
    response =
      {:ok,
       {{'HTTP/1.1', 200, 'OK'}, [{'connection', 'keep-alive'}],
        '[{"temp":14.12,"temp_min":14.12,"temp_max":15.11}]'}}

    assert validate_response(response) == { :ok, [%{"temp" => 14.12, "temp_max" => 15.11, "temp_min" => 14.12}]}
  end

  test "gets the body of the response and it validates it" do
    response =
      {:ok,
       {{'HTTP/1.1', 404, 'Not Found'}, [{'connection', 'keep-alive'}],
        'Not found'}}

    assert validate_response(response) == { :error, :city_not_found}
  end

  test "gets the status line of the response" do
    response =
      {:ok,
       {{'HTTP/1.1', 200, 'OK'}, [{'connection', 'keep-alive'}],
        '[{"temp":14.12,"temp_min":14.12,"temp_max":15.11}]'}}

    assert get_status_line(response) == {'HTTP/1.1', 200, 'OK'}
  end

  test "parses the city" do
    city = "New York"
    assert parse_city(city) == "New+York"
  end

end
