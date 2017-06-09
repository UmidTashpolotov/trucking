class AddDefaultValueToBid < ActiveRecord::Migration[5.0]
  def change
    change_column_default :bids, :status, 'new'
  end
end
