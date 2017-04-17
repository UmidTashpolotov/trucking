class AddColumnsToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :from_city, :string
    add_column :orders, :to_city, :string
    add_column :orders, :cargo, :string
    add_column :orders, :price, :string
  end
end
