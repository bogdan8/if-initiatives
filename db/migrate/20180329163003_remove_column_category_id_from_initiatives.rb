class RemoveColumnCategoryIdFromInitiatives < ActiveRecord::Migration[5.1]
  def change
    remove_column :initiatives, :category_id
  end
end
