class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :selling_price, :merchant_id, :description, :category_id
  belongs_to :merchant
end
