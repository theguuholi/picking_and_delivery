defmodule PickingAndDelivery.Pickings.Data.Store do
  alias PickingAndDelivery.Pickings.Data.Product
  defstruct ~w/description id lat lng name products total_products/a

  def new(store, products) do
    %__MODULE__{
      name: store["name"],
      id: store["id"],
      description: store["description"],
      lat: store["lat"],
      lng: store["lng"],
      products: Enum.map(products, &Product.new(&1)),
      total_products: Enum.count(products)
    }
  end
end
