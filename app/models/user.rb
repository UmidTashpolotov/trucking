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
end