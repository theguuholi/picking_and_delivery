defmodule PickingAndDelivery.Repo do
  use Ecto.Repo,
    otp_app: :picking_and_delivery,
    adapter: Ecto.Adapters.Postgres
end
