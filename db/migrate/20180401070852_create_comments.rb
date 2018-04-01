class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :title, default: ''
      t.text :text, default: ''
      t.integer :initiative_id
      t.integer :user_id

      t.timestamps
    end

    add_index :comments, %i[initiative_id user_id]
  end
end
