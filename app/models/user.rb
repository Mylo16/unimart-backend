class User < ApplicationRecord
  has_secure_password

  has_many :products, foreign_key: :merchant_id, class_name: 'Product'
  has_many :sales, foreign_key: :merchant_id, class_name: 'Sale'
  has_many :orders
end
