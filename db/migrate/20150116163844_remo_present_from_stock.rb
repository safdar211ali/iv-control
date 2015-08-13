class RemoPresentFromStock < ActiveRecord::Migration
  def change
    remove_column :stocks,:qtypresent
  end
end
