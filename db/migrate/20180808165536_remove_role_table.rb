class RemoveRoleTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :users_roles
    drop_table :roles
  end
end
