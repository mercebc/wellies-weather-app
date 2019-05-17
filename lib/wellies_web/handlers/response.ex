defmodule WelliesWeb.ResponseHandler do
  def get_body(response) do
    case response do
      {:ok, {{'HTTP/1.1', 200, 'OK'}, _headers, body}} ->
        Jason.decode!(body)
    end
  end

  def get_status_line(response) do
    case response do
      {_status, {status_line, _headers, _body}} ->
        status_line
    end
  end
end
