class AddCatergoryIdToIssuances < ActiveRecord::Migration
  def change
    add_column :issuances, :category_id, :integer,:index=>true
  end
end
