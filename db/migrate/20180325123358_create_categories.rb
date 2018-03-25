class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :title
      t.string :slug
      t.integer :position

      t.timestamps
    end
  end
end
