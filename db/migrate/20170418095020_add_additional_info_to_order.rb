class AddAdditionalInfoToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :weight, :integer
    add_column :orders, :volume, :integer
    add_column :orders, :transport, :string
    add_column :orders, :departure_date, :date
    add_column :orders, :payment_method, :string
    add_column :orders, :temperature_regime, :string
    add_column :orders, :loading_type, :string
  end
end
