class OrdersController < ApplicationController


  def index
    @orders = Order.all
  end

  def show
    authorize! :read, @order
    @order = Order.find(params[:id])
    @offer = Offer.new
    @comment = Comment.new
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

  def close
    authorize! :close, @order
    @order = Order.find(params[:id])
    @order.close
    redirect_to order_path(@order)
  end

  def complete
    authorize! :complete, @order
    @order = Order.find(params[:id])
    @order.complete
    redirect_to order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:about, :from_city, :to_city, :cargo, :price,
                                  :weight, :volume, :transport, :departure_date,
                                  :payment_method, :temperature_regime,
                                  :loading_type)
  end
end
