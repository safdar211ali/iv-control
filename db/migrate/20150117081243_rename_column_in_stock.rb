class RenameColumnInStock < ActiveRecord::Migration
  def change
    rename_column :stocks,:qtybalance,:qtyreceived
  end
end
