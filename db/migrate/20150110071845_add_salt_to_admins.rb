class AddSaltToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :salt, :string,:limit => 40
  end
end
