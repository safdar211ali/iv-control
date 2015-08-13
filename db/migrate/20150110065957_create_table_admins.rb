class CreateTableAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :display_name
      t.string :email
      t.string :role
    end
  end
end
