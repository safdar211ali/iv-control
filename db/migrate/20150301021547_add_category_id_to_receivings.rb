class AddCategoryIdToReceivings < ActiveRecord::Migration
  def change
    add_column :receivings, :category_id, :integer,:index=>true
  end
end
