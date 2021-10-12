defmodule PickingAndDeliveryWeb.PickingLive do
  use PickingAndDeliveryWeb, :live_view
  alias PickingAndDelivery.Pickings

  def mount(_assings, _session, socket) do
    {:ok, socket}
  end

  def handle_params(params, _, socket) do
    stores = list_all_stores()
    selected_store = params["id"] && get_store(stores, params["id"]) || nil
    socket =
      socket
      |> assign(stores: stores)
      |> assign(selected_store: selected_store)
      |> push_event("highlight-marker", selected_store)
      |> push_event("add-marker", selected_store)

    {:noreply, socket}
  end

  defp list_all_stores(), do: Pickings.list_all_stores()

  defp get_store(stores, id) do
    Enum.find(stores, &(&1.id == id))
  end

  def handle_event("select-store", %{"id" => id}, socket) do
    store = get_store(socket.assigns.stores, id)
    socket =
      socket
      |> assign(selected_store: store)
      |> push_event("highlight-marker", store)

    {:noreply, socket}
  end

  def handle_event("store-clicked", %{"store_id" => id}, socket) do
    IO.inspect id
    store = get_store(socket.assigns.stores, id)
    socket =
      socket
      |> assign(selected_store: store)
      |> push_patch(to: "/pickings?id=#{store.id}")

    {:noreply, socket}
  end
end
