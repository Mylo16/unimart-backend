class Api::V1::CategoriesController < ApplicationController
  before_action :require_login

  def index
    @categories = Category.all
    render json: @categories
  end

  def show
    @category = Category.find(params[:id])
    render json: @category
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      render json: @category, status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if session_user.user_type == 'admin'
      @category.destroy
      render json: { message: "Category deleted successfully" }
    else
      render json: { message: "You are not authorized to delete this category" }
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
