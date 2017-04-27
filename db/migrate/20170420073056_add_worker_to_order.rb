class AddWorkerToOrder < ActiveRecord::Migration[5.0]
  def change
    add_reference :'orders.rb.feature', :worker, foreign_key: true
  end
end
