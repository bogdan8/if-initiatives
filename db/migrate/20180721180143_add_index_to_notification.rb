class AddIndexToNotification < ActiveRecord::Migration[5.1]
  def change
    add_index :notifications, :actor_id
    add_index :notifications, :target_id
    add_index :notifications, :second_target_id
    add_index :notifications, :third_target_id
  end
end
