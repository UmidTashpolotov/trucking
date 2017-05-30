class AddNikitaIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nikita_id, :string, unique: true
  end
end
