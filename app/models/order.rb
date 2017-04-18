class Order < ApplicationRecord
  belongs_to :user
  has_many :offers, dependent: :destroy

  def selected_offer
    self.offers.where(accepted: true)
  end
end