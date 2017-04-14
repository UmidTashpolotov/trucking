class OffersController < ApplicationController
  def create
  	@offer = Offer.new(offer_params)

  	if @offer.save
  		redirect_to :back
  	else
  		redirect_to root_path
  	end
  end

  private
  def offer_params
    params.require(:offer).permit(:status, :about, :user_id, :order_id)
  end
end
