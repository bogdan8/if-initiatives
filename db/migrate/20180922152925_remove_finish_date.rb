class RemoveFinishDate < ActiveRecord::Migration[5.1]
  def change
    remove_column :initiatives, :finish_date
  end
end
