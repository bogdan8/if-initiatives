class AddAdminToNotification < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :admin_id, :integer, after: :user_id
    add_index :notifications, :admin_id
  end
end
