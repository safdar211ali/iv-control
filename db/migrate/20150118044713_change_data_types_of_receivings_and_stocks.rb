class ChangeDataTypesOfReceivingsAndStocks < ActiveRecord::Migration
  def change
    change_column :receivings,:qtypresent,:decimal
    change_column :receivings,:qtyreceived,:decimal
    change_column :receivings,:qtybalance,:decimal
    change_column :stocks,:qtyreceived,:decimal
  end
end
