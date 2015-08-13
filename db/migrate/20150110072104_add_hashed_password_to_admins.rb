class AddHashedPasswordToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :hashed_password, :string,:limit => 40
  end
end
