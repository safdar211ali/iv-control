class AddUnitToItems < ActiveRecord::Migration
  def change
    add_column :items, :unit, :string,:default => ''
  end
end
