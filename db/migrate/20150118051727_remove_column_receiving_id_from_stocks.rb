class RemoveColumnReceivingIdFromStocks < ActiveRecord::Migration
  def change
    remove_column :stocks,:receiving_id
  end
end
