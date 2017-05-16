class AddImeiToCar < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :imei, :string
  end
end
