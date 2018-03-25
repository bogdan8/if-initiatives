class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string, default: ""
    add_column :users, :phone, :string, default: ""
    add_column :users, :age, :integer, default: ""
  end
end
