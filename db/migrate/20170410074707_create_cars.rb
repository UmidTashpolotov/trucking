class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :about
      t.references :user, foreign_key: { to_table: users }

      t.timestamps
    end
  end
end
