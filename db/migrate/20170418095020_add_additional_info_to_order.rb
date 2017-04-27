class AddAdditionalInfoToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :'orders.rb.feature', :weight, :integer
    add_column :'orders.rb.feature', :volume, :integer
    add_column :'orders.rb.feature', :transport, :string
    add_column :'orders.rb.feature', :departure_date, :date
    add_column :'orders.rb.feature', :payment_method, :string
    add_column :'orders.rb.feature', :temperature_regime, :string
    add_column :'orders.rb.feature', :loading_type, :string
  end
end
