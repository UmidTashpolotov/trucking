class Order < ApplicationRecord
  belongs_to :user
  has_many :offers, dependent: :destroy

  def selected_offer
    self.offers.where(accepted: true)
  end

  def open
    self.status = 'open'
    save
  end

  def in_progress
    self.status = 'in_progress'
    save
  end

  def close
    self.status = 'closed'
    save
  end

  def complete
    self.status = 'completed'
    save
  end

end