class AddColumnFinishDaysToInitiative < ActiveRecord::Migration[5.1]
  def change
    add_column :initiatives, :finish_days, :integer, default: 5
  end
end
