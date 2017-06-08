class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      t.string :from_city
      t.string :to_city
      t.string :weight
      t.string :volume
      t.string :phone
      t.string :status

      t.timestamps
    end
  end
end
