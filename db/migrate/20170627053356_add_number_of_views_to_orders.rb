class AddNumberOfViewsToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :number_of_views, :integer, default: 0
  end
end
