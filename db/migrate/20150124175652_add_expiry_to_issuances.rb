class AddExpiryToIssuances < ActiveRecord::Migration
  def change
    add_column :issuances, :expiry, :date
  end
end
