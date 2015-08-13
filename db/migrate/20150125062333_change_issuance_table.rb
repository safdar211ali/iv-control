class ChangeIssuanceTable < ActiveRecord::Migration
  def change
    change_column :issuances,:created_at,:date
  end
end
