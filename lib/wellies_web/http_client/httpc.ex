defmodule HTTPClientBehaviour do
  @callback get(String.t) :: String.t
end

defmodule WelliesWeb.HTTPClient do
  @behaviour HTTPClientBehaviour

  Application.ensure_all_started(:inets)
  Application.ensure_all_started(:ssl)

  def get(url) do
    :httpc.request(:get, {url, []}, [], [])
  end
end
