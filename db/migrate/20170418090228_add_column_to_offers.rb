class AddColumnToOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :accepted, :boolean, default: false
  end
end
