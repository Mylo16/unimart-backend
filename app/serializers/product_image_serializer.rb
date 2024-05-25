class ProductImageSerializer < ActiveModel::Serializer
  attributes :id, :image_url, :product_id
  belongs_to :product
end
