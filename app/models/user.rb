class User < ApplicationRecord
  before_validation :phone_number_format

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:phone]
	validates :role, inclusion: { in: ['customer', 'admin', 'worker'] }

  validates :phone, presence: true,
                    numericality: true,
                    uniqueness: true,
                    length: { is: 12}

  has_many :cars, dependent: :destroy
  has_many :documents, dependent: :destroy
  has_many :offers, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :worked_orders, foreign_key: 'worker_id', class_name: 'Order'
  has_many :comments, foreign_key: 'to_user_id'
  has_many :commented_on, foreign_key: 'from_user_id', class_name: 'Comment'

  ROLES = %w[ customer worker ]

  def phone_number_format
    self.phone = '996' + self.phone.to_s
  end

  def admin?
    role == 'admin'
  end

  def inactive?
    !active?
  end

  def worker?
    role == 'worker'
  end

  def customer?
    role == 'customer'
  end

  def inactive_worker?
    inactive? && worker?
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

    blank_fields
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def cars_with_gps
    return [] unless worker_with_cars
    cars.reject { |car| car.imei.blank? }
  end

  def search_devices
    return [] unless worker?
    cars_with_gps.map(&:device)
  end

  def worker_with_cars
    worker? || !cars.blank?
  end

  def check_phone
    update_attribute(:phone_checked, true)
  end

  def uncheck_phone
    update_attribute(:phone_checked, false)
  end

end