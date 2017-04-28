class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :from_user, foreign_key: { to_table: users }
      t.references :to_user, foreign_key: { to_table: users }
      t.references :order, foreign_key: { to_table: :orders }
      t.text :body
      t.integer :rating

      t.timestamps
    end
  end
end
