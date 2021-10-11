defmodule PickingAndDelivery.Pickings.Data.Product do
  defstruct ~w/name id delivered/a

  def new(product) do
    %__MODULE__{
        name: product["name"],
        id: BSON.ObjectId.encode!(product["_id"]),
        delivered: product["delivered"]
      }
  end
end
