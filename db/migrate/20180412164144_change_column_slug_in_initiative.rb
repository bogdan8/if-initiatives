class ChangeColumnSlugInInitiative < ActiveRecord::Migration[5.1]
  def change
    remove_column :initiatives, :slug

    add_column :initiatives, :slug, :string
    add_index :initiatives, :slug, unique: true
  end
end
