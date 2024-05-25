class OrderSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :product_id, :status, :quantities
  belongs_to :user
  belongs_to :product
end
