defmodule PickingAndDeliveryWeb.PickingLive do
  use PickingAndDeliveryWeb, :live_view
  alias PickingAndDelivery.Pickings

  def mount(_assings, _session, socket) do
    {:ok, socket}
  end

  def handle_params(params, _, socket) do
    socket =
      socket
      |> assign(stores: list_all_stores())
      |> assign(selected_store: params["id"])

    {:noreply, socket}
  end

  defp list_all_stores(), do: Pickings.list_all_stores()

  def handle_event("select-store", %{"id" => id}, socket) do
    IO.inspect(id)
    {:noreply, socket}
  end
end
