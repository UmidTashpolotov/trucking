class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	validates :role, inclusion: { in: ['customer', 'admin', 'worker'] }

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

  def activate
    update_attribute :active, true
  end

  def deactivate
    update_attribute :active, false
  end

  def profile_uncomplete?
    if role == 'customer'
      name.blank? || surname.blank? || phone.blank?
    elsif role == 'worker'
      name.blank? || surname.blank? || phone.blank? || cars.blank? || documents.blank?
    end
  end

  def blank_fields
    blank_fields = []

    blank_fields << 'name' if name.blank?
    blank_fields << 'surname' if surname.blank?
    blank_fields << 'phone' if phone.blank?
    blank_fields << 'car' if cars.blank? && role == 'worker'
    blank_fields << 'document' if documents.blank? && role == 'worker'

    return blank_fields
  end
end