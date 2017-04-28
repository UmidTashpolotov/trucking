class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.references :user, foreign_key: { to_table: users }
      t.references :order, foreign_key: { to_table: orders }
      t.string :status
      t.text :about

      t.timestamps
    end
  end
end
