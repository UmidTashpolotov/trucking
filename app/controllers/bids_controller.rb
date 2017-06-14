class BidsController < ApplicationController

  def new
  end

  def create
    @bid = Bid.new(bid_params)
    if @bid.save
      redirect_back(fallback_location: root_path, notice: t('bid_created'))
    else
      redirect_to root_path, notice: 'Заполните все поля.'
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:from_city, :to_city, :weight, :volume, :phone, :status)
  end
end
