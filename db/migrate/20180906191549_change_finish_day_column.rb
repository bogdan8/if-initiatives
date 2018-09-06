class ChangeFinishDayColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :initiatives, :finish_days
    remove_column :initiatives, :finish_date
    add_column :initiatives, :finished_at, :datetime
  end
end
