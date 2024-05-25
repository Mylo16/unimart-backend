class Api::V1::ProductsController < ApplicationController
  before_action :require_login

  def index
    @products = Product.all
    render json: @products.as_json(methods: :image_url)
  end

  def show
    @product = Product.find(params[:id])
    render json: @product.as_json(methods: :image_url)
  end

  def create
    @product = session_user.products.new(product_params)
    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      render json: @product.as_json(methods: :image_urls)
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @product = session_user.products.find(params[:id])
    @product.destroy
    render json: { message: "Product deleted successfully" }
    end
  end

  private

  def product_params
    params.require(:product).permit(:merchant_id, :name, :description, :price, :selling_price, :quantities, :category_id, images: [])
  end
end
