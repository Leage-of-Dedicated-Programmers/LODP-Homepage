defmodule Lodp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Lodp.Repo,
      # Start the Telemetry supervisor
      LodpWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Lodp.PubSub},
      # Start the Endpoint (http/https)
      LodpWeb.Endpoint
      # Start a worker by calling: Lodp.Worker.start_link(arg)
      # {Lodp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Lodp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LodpWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
