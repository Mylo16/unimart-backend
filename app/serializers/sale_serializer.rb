class SaleSerializer < ActiveModel::Serializer
  attributes :id, :merchant_id, :product_id
  belongs_to :product
  belongs_to :merchant
end
