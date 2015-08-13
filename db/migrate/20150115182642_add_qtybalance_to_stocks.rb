class AddQtybalanceToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :qtybalance, :integer
  end
end
