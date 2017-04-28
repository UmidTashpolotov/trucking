class AddWorkerToOrder < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :worker, foreign_key: { to_table: users }
  end
end
