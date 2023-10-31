defmodule Alert.Repo do
  use Ecto.Repo,
    otp_app: :alert,
    adapter: Ecto.Adapters.Postgres
end
