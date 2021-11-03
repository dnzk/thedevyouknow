defmodule Thedevyouknow.Repo do
  use Ecto.Repo,
    otp_app: :thedevyouknow,
    adapter: Ecto.Adapters.Postgres
end
