class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :donations, :internet_banking, :status
  end
end
