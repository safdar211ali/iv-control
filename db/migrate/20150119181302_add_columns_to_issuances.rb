class AddColumnsToIssuances < ActiveRecord::Migration
  def change
    add_column :issuances,:name,:string
    add_column :issuances,:qtysingle,:decimal
    add_column :issuances,:qtysingleb,:decimal
  end
end
