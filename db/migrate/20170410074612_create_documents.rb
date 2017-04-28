class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :title
      t.references :user, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
