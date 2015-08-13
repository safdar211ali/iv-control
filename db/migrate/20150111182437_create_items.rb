class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :category_id,:index=>true
      t.string :name
      t.text :description
      t.string :cas_no
      t.integer :reorder_level

      t.timestamps
    end
  end
end
