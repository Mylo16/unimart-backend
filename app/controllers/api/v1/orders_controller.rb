class Api::V1::OrdersController < ApplicationController
  before_action :require_login

  def index
    @user = User.find(params[:user_id])
    @orders = @user.orders.all
    render json: @orders
  end

  def show
    @order = Order.find(params[:id])
    render json: @order
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = params[:user_id]
    if @order.save
      render json: @order, status: :created
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @order = Order.find(params[:id])
    if @order.user_id == session_user.id
      @order.destroy
      render json: { message: "Order deleted successfully" }
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :product_id, :status, :quantities)
  end

end
