class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	validates :role, :inclusion=> { :in => ['customer', 'admin', 'worker'] }
  has_many :cars
  has_many :documents
  has_many :offers
  has_many :orders
  has_many :worked_orders, foreign_key: 'worker_id', class_name: 'Order'
  has_many :comments, foreign_key: 'to_user_id'
  has_many :commented_on, foreign_key: 'from_user_id', class_name: 'Comment'

  ROLES = %w[ customer worker ]

  def admin?
    self.role == 'admin'
  end

  def worker?
    self.role == 'worker'
  end

  def customer?
    self.role == 'customer'
  end

end