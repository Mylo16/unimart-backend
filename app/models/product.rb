class Product < ApplicationRecord
  belongs_to :merchant
  belongs_to :category
  has_many :orders
  has_many :sales

  has_many_attached :images

  def image_url
    Rails.application.routes.url_helpers.rails_blob_url(image, only_path: true) if image.attached?
  end
end
