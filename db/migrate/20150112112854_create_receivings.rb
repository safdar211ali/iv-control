class CreateReceivings < ActiveRecord::Migration
  def change
    create_table :receivings do |t|
      t.integer :item_id,:index=>true
      t.integer :user_id,:index=>true
      t.text :description
      t.integer :qtypresent,:default=>0
      t.integer :qtyreceived,:default=>0
      t.integer :qtybalance,:default=>0
      t.date :expiry
      t.timestamps
    end
  end
end
