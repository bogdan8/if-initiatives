class ChangeFinishDayColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :initiatives, :finish_days
    add_column :initiatives, :finished_at, :datetime
  end
end
