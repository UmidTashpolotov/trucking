class OffersController < ApplicationController
  def create
  	@offer = Offer.new(offer_params)

  	if @offer.save
  		redirect_to :back
  	else
  		redirect_to root_path
  	end
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.update(offer_params)
    redirect_to order_path(@offer.order)
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy if @offer.user == current_user
    redirect_to :back
  end

  private
  def offer_params
    params.require(:offer).permit(:status, :about, :user_id, :order_id)
  end
end
