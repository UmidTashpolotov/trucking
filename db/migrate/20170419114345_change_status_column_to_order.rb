class ChangeStatusColumnToOrder < ActiveRecord::Migration[5.0]
  def change
    change_column_default :orders, :status, 'open'
  end
end
