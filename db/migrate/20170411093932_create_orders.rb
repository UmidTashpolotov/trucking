class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :'orders.rb.feature' do |t|
      t.references :user, foreign_key: true
      t.text :about
      t.string :status, default: "new"

      t.timestamps
    end
  end
end
