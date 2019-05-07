defmodule Wellies.Repo do
  use Ecto.Repo,
    otp_app: :wellies,
    adapter: Ecto.Adapters.Postgres
end
