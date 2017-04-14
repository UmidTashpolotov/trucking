class OrdersController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]

	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.create(order_params)
    if @order.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def order_params
    params.require(:order).permit(:about)
  end
end
