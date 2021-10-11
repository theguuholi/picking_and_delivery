defmodule PickingAndDeliveryWeb.StoreLive do
  use PickingAndDeliveryWeb, :live_view
  alias PickingAndDelivery.Pickings

  def mount(_assings, _session, socket) do
    socket = assign(socket, stores: list_all_stores())
    {:ok, socket}
  end

  defp list_all_stores(), do: Pickings.list_all_stores

  defp list_products(), do: PickingAndDeliveryWeb.Store.ProductsComponent
end
