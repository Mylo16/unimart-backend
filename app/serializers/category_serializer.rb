class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :product_id
  has_many :products
end
