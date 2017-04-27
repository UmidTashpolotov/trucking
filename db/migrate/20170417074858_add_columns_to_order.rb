class AddColumnsToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :'orders.rb.feature', :from_city, :string
    add_column :'orders.rb.feature', :to_city, :string
    add_column :'orders.rb.feature', :cargo, :string
    add_column :'orders.rb.feature', :price, :string
  end
end
