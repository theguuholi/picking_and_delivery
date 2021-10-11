defmodule PickingAndDelivery.Pickings.Core.UpdatePicking do

  def execute(id, products) do
    update_mongo(id)
    products
    |> Enum.map(fn product ->
      if product.id == id do
        Map.put(product, :delivered, true)
      else
        product
      end
    end)
  end

  defp update_mongo(id) do
    Mongo.update_one(:mongo, "orders", %{"_id" => BSON.ObjectId.decode!(id)},  %{"$set" => %{"delivered" => true}})
  end
end
