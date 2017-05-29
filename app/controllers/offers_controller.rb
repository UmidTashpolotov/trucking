class OffersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def create
    @order = Order.find(params[:order_id])
    authorize! :offer, @order
  	@offer = Offer.new(offer_params)
    @offer.user = current_user
    @offer.order = @order
    @offer.status = 'new'
  	if @offer.save
      redirect_back(fallback_location: root_path)
  	else
  		redirect_to root_path
  	end
  end

  def edit
    authorize! :update, @offer
    @offer = Offer.find(params[:id])
  end

  def update
    authorize! :update, @offer
    @offer = Offer.find(params[:id])
    @offer.update(offer_params) if @offer.user == current_user
    redirect_to order_path(@offer.order)
  end

  def destroy
    authorize! :destroy, @offer
    @offer = Offer.find(params[:id])
    @offer.destroy if @offer.user == current_user
    redirect_back(fallback_location: root_path)
  end

  def accept
    authorize! :accept, @offer
    @offer = Offer.find(params[:id])
    @order = @offer.order
    @offer.accept
    @order.in_progress
    @order.update(worker: @offer.user)
    redirect_back(fallback_location: root_path)
  end

  def reject
    authorize! :reject, @offer
    @offer = Offer.find(params[:id])
    @order = @offer.order
    @offer.reject
    @order.open
    @order.update(worker: nil)
    redirect_back(fallback_location: root_path)
  end

  private

  def offer_params
    params.require(:offer).permit(:status, :about, :user_id, :order_id)
  end
end
