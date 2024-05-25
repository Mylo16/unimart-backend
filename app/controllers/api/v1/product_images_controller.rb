class Api::V1::ProductImagesController < ApplicationController
  before_action :require_login

  def index
    @product = Product.find(params[:product_id])
    @product_images = @product.product_images.all
    render json: @product_images
  end

  def show
    @product_image = ProductImage.find(params[:id])
    render json: @product_image
  end

  def create
    @product_image = ProductImage.new(product_image_params)
    @product_image.product_id = params[:product_id]
    if @product_image.save
      render json: @product_image, status: :created
    else
      render json: @product_image.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @product_image = ProductImage.find(params[:id])
    @product = Product.find(params[:product_id])
    if @product.merchant_id == session_user.id
      @product_image.destroy
      render json: { message: "product_image deleted successfully" }
    end
  end

  private

  def product_image_params
    params.require(:product_image).permit(:image_url, :product_id)
  end

end
