class ChangeReceivingDate < ActiveRecord::Migration
  def change
    change_column :receivings,:created_at,:date
  end
end
