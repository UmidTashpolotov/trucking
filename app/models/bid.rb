class Bid < ApplicationRecord
  def close
    self.status = 'old'
    save
  end

  def new?
    status == 'new'
  end
end
