class Car < ApplicationRecord
  belongs_to :user

  validates :about, presence: true
  validates :weight, presence: true
  validates :volume, presence: true
  validates :car_type, presence: true
  validates :load_type, presence: true

  WEIGHT_SAMPLE = %w(3т. 5т. 10т. 15т. 20т.)
  VOLUME_SAMPLE = %w(до\ 50\ кубов. 86\ кубов. 96\ кубов. 120\ кубов.)
  LOAD_TYPE_SAMPLE = %w(задняя боковая задняя\ боковая верхняя)
  CAR_TYPE_SAMPLE = %w(тент крытая изотерм цельномет рефрижератор бортовой самосвал контейнеровоз автовоз зерновоз седельный тягач трал цистерна другое)
end