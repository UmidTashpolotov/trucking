class Bid < ApplicationRecord
  validates :from_city, presence: true
  validates :to_city, presence: true
  validates :weight, presence: true
  validates :volume, presence: true
  validates :phone, presence: true

  def close
    self.status = 'old'
    save
  end

  def new?
    status == 'new'
  end
end
