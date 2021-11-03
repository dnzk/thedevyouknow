defmodule Thedevyouknow.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Thedevyouknow.Repo,
      # Start the Telemetry supervisor
      ThedevyouknowWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Thedevyouknow.PubSub},
      # Start the Endpoint (http/https)
      ThedevyouknowWeb.Endpoint
      # Start a worker by calling: Thedevyouknow.Worker.start_link(arg)
      # {Thedevyouknow.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Thedevyouknow.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ThedevyouknowWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
