class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  load_and_authorize_resource

	def index
    if user_signed_in?
      if current_user.customer?
        @orders = current_user.orders.page(params[:page]).per(10)
      elsif current_user.worker?
        @orders = Order.where(status: 'open').page(params[:page]).per(10)
      else
        @orders = Order.all.page(params[:page]).per(10)
      end
    else
      @orders = Order.where(status: 'open').limit(10).page(params[:page]).per(10)
    end
	end

	def show
		@order = Order.find(params[:id])
    @order.add_view_number
    authorize! :read, @order
    @offer = Offer.new
    @comment = Comment.new
  end

  def my
    @orders = Order.where(worker_id: current_user).page(params[:page]).per(10)
  end

  def new
    @order = Order.new
    authorize! :create, @order
  end

  def create
    @order = current_user.orders.create(order_params)
    authorize! :create, @order
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
                                  :loading_type, :number_of_views)
  end
end
