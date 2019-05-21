defmodule WelliesWeb.ResponseHandler do
  def validate_response(response) do
    case response do
      {:ok, {{'HTTP/1.1', 200, 'OK'}, _headers, body}} -> {:ok, Jason.decode!(body)}
      {:ok, {{'HTTP/1.1', 404, 'Not Found'}, _headers, _body}} -> {:error, :city_not_found}
    end
  end

  def get_status_line(response) do
    case response do
      {_status, {status_line, _headers, _body}} ->
        status_line
    end
  end

  def parse_city(city) do
    city
    |> String.replace(" ", "+")
  end

  def format_body(response, func) do
    case response do
      {:ok, body} -> {:ok, func.(body)}
      {:error, _} -> {:error, :city_not_found}
    end
  end
end
