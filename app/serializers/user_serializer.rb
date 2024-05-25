class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :phone_number, :email, :full_name, :user_type
  has_many :products, foreign_key: :merchant_id, class_name: 'Product'
  has_many :sales, foreign_key: :merchant_id, class_name: 'Sale'
  has_many :orders
end
