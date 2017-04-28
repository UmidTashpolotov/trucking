class AddColumnsToCar < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :weight, :string
    add_column :cars, :volume, :string
    add_column :cars, :load_type, :string
    add_column :cars, :car_type, :string
  end
end