class RenameColumnSumInUser < ActiveRecord::Migration[5.1]
  def change
    rename_column :initiatives, :sum, :general_sum
  end
end
