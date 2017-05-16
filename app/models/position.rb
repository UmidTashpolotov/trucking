class Position < ActiveRecord::Base
  establish_connection :traccar_db
  self.table_name = 'positions'
  belongs_to :device, class_name: 'Device'
end