class AgainUserIdToIssuance < ActiveRecord::Migration
  def change
    remove_column :issuances,:user_id
    add_column :issuances,:user_id,:integer,:index=>true
  end
end
