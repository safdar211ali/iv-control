class AddUserIdToIssuances < ActiveRecord::Migration
  def change
    add_column :issuances, :user_id, :integer
  end
end
