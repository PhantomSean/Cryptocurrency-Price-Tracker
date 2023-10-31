defmodule CryptocurrencyData.Repo do
  use Ecto.Repo,
    otp_app: :cryptocurrency_data,
    adapter: Ecto.Adapters.Postgres
end
