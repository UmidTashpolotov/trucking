class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :order

  validates :about, presence: true

  def accept
    self.accepted = true
    save
  end

  def reject
    self.accepted = false
    save
  end
end
