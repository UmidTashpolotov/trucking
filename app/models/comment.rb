class Comment < ApplicationRecord
  belongs_to :from_user, class_name: 'User'
  belongs_to :to_user, class_name: 'User'
  belongs_to :order

  validates :body, presence: true
  validates :rating, presence: true
end
