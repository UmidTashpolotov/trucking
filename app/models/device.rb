class Device < ActiveRecord::Base
  establish_connection :traccar_db
  self.table_name = 'devices'
  has_many :positions, foreign_key: 'deviceid'
end