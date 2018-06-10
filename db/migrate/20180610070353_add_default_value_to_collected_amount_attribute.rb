class AddDefaultValueToCollectedAmountAttribute < ActiveRecord::Migration[5.1]
  def change
    change_column :initiatives, :collected_amount, :integer, default: 0
  end
end
