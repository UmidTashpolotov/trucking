class BidsController < ApplicationController

  def new
    @bid = Bid.new
  end

  def create
    @bid = Bid.new(bid_params)
    if @bid.save
      if user_signed_in?
        render 'success'
      else
        redirect_back(fallback_location: root_path, notice: t('bid_created'))
      end
    else
      if user_signed_in?
        render 'new'
      else
        redirect_back(fallback_location: root_path, notice: 'Заполните все поля.')
      end
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:from_city, :to_city, :weight, :volume, :phone, :status)
  end
end
