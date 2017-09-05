class ChangeCategoryIdInItems < ActiveRecord::Migration[5.1]
  def change
    rename_column :items, :category_id, :category
  end
end
