class AaddRol < ActiveRecord::Migration
  def change
    add_column :users,:role,:string,:default => 'new'
  end
end
