class OrdersController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]
  load_and_authorize_resource

	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
    authorize! :read, @order
    @offer = Offer.new
  end

  def new
    authorize! :create, @order
    @order = Order.new
  end

  def create
    authorize! :create, @order
    @order = current_user.orders.create(order_params)
    if @order.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    authorize! :destroy, @order
    @order = Order.find(params[:id])
    @order.destroy if @order.user == current_user
    redirect_to root_path
  end

  private

  def order_params
    params.require(:order).permit(:about, :from_city, :to_city, :cargo, :price,
                                  :weight, :volume, :transport, :departure_date,
                                  :payment_method, :temperature_regime,
                                  :loading_type)
  end
end
