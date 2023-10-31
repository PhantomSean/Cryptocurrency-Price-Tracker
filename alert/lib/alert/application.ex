defmodule Alert.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AlertWeb.Telemetry,
      Alert.Repo,
      {DNSCluster, query: Application.get_env(:alert, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Alert.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Alert.Finch},
      # Start a worker by calling: Alert.Worker.start_link(arg)
      # {Alert.Worker, arg},
      # Start to serve requests, typically the last entry
      AlertWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Alert.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AlertWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
