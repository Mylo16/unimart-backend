class Api::V1::SalesController < ApplicationController
  before_action :require_login

  def index
    @user = User.find(params[:user_id])
    @sales = @user.sales.all
    render json: @sales
  end

  def show
    @sale = Sale.find(params[:id])
    render json: @sale
  end

  def create
    @sale = Sale.new(sale_params)
    @sale.user_id = params[:user_id]
    if @sale.save
      render json: @sale, status: :created
    else
      render json: @sale.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @sale = Sale.find(params[:id])
    if @sale.merchant_id == session_user.id
      @sale.destroy
      render json: { message: "Sale deleted successfully" }
    end
  end

  private

  def sale_params
    params.require(:sale).permit(:merchant_id, :product_id)
  end

end
