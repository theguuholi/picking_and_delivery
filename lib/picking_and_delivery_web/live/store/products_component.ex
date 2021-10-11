defmodule PickingAndDeliveryWeb.Store.ProductsComponent do
  use PickingAndDeliveryWeb, :live_component
  alias PickingAndDelivery.Pickings

  def update(assigns, socket) do
    {:ok, assign(socket, assigns)}
  end

  def product(assigns) do
    product = assigns.product
    target = assigns.target
    ~H"""
        <li id={product.id}>
          <%= product.name %> -
          <strong>Entregue?:</strong> <.delivered status={product.delivered} /> -
          <button id={"update-product-" <> product.id} phx-target={target} phx-click="deliver" disabled={product.delivered} phx-value-id={product.id}>
            <%= if product.delivered do %>
              Entregue
            <% else %>
              Entregar
            <% end %>
          </button>
        </li>
    """
  end

  def delivered(assigns) do
    status = assigns.status && "Yes" || "No"
    ~H"""
      <%= status %>
    """
  end

  def handle_event("deliver", %{"id" => id}, socket) do
    products = Pickings.update_picking(id, socket.assigns.products)
    {:noreply, update(socket, :products, fn _ -> products end)}
  end

end
