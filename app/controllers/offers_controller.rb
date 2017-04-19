class OffersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  def create
    authorize! :create, @offer
  	@offer = Offer.new(offer_params)
  	if @offer.save
  		redirect_to :back
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
    redirect_to :back
  end

  def accept
    authorize! :accept, @offer
    offer = Offer.find(params[:id])
    offer.accept
    offer.order.in_progress
    redirect_to :back
  end

  def reject
    authorize! :reject, @offer
    offer = Offer.find(params[:id])
    offer.reject
    offer.order.open
    redirect_to :back
  end

  private

  def offer_params
    params.require(:offer).permit(:status, :about, :user_id, :order_id)
  end
end
