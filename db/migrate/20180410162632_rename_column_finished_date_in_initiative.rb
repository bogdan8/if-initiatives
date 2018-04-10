class RenameColumnFinishedDateInInitiative < ActiveRecord::Migration[5.1]
  def change
    rename_column :initiatives, :finished_date, :finish_date
  end
end
