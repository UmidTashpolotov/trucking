class ChangeStatusColumnToOrder < ActiveRecord::Migration[5.0]
  def change
    change_column_default :'orders.rb.feature', :status, 'open'
  end
end
