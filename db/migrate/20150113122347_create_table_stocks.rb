class CreateTableStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.integer :receiving_id,:index=>true
      t.integer :item_id,:index=>true
      t.date :expiry
      t.integer :qtypresent,:default=>0
      t.timestamps
    end
  end
end
