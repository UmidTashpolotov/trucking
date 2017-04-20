class Order < ApplicationRecord
  belongs_to :user
  belongs_to :worker, class_name: 'User'
  has_many :offers, dependent: :destroy
  has_many :comments

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

  def has_comment_from(user)
    comments.exists?(from_user: user)
  end
end