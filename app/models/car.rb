class Car < ApplicationRecord
  NULL_ATTRS = %w( imei )
  before_validation :nil_if_blank
  belongs_to :user
  has_one :device, foreign_key: 'uniqueid', primary_key: 'imei',
                dependent: :destroy

  validates :about, presence: true
  validates :weight, presence: true
  validates :volume, presence: true
  validates :car_type, presence: true
  validates :load_type, presence: true
  validates :imei, uniqueness: true, allow_nil: true

  WEIGHT_SAMPLE = %w(3т. 5т. 10т. 15т. 20т.)
  VOLUME_SAMPLE = %w(до\ 50\ кубов. 86\ кубов. 96\ кубов. 120\ кубов.)
  LOAD_TYPE_SAMPLE = %w(задняя боковая задняя\ боковая верхняя)
  CAR_TYPE_SAMPLE = %w(тент крытая изотерм цельномет рефрижератор бортовой самосвал контейнеровоз автовоз зерновоз седельный тягач трал цистерна другое)

  def has_tracker?
    !device.blank?
  end

  def has_position?
    !device.positions.last.blank?
  end

  protected

  def nil_if_blank
    NULL_ATTRS.each { |attr| self[attr] = nil if self[attr].blank? }
  end

end