defmodule Lodp.Repo do
  use Ecto.Repo,
    otp_app: :lodp,
    adapter: Ecto.Adapters.Postgres
end
