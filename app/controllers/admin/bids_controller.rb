class Admin::BidsController < AdminController
  def index
    @bids = case params[:sort]
              when 'new'
                Bid.where(status: 'new')
              when 'old'
                Bid.where(status: 'old')
              else
                Bid.all
            end
    @bids = @bids.page(params[:page]).per(10).order('created_at DESC')
  end

  def close
    Bid.find(params[:id]).close
    redirect_back(fallback_location: root_path)
  end

  # def search_results
  #   @bids = Bid.search_everywhere(params[:query])
  #   @bids = @bids.page(params[:page]).per(10).order('created_at DESC')
  # end
end
