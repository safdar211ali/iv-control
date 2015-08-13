class CreateIssuances < ActiveRecord::Migration
  def change
    create_table :issuances do |t|
      t.integer :item_id
      t.text :description
      t.decimal :qtyissued
      t.decimal :qtypresent
      t.decimal :qtybalance

      t.timestamps
    end
  end
end
