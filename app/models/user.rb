class User < ApplicationRecord
	validates :role, :inclusion=> { :in => ['customer', 'admin', 'worker'] }
  has_many :cars
  has_many :documents
end