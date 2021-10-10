defmodule PickingAndDelivery.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      PickingAndDelivery.Repo,
      # Start the Telemetry supervisor
      PickingAndDeliveryWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PickingAndDelivery.PubSub},
      # Start the Endpoint (http/https)
      PickingAndDeliveryWeb.Endpoint
      # Start a worker by calling: PickingAndDelivery.Worker.start_link(arg)
      # {PickingAndDelivery.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PickingAndDelivery.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PickingAndDeliveryWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
