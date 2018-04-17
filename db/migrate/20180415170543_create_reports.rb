class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|t.string :title
      t.string :title
      t.text :description
      t.references :initiative, foreign_key: true

      t.timestamps
    end
  end
end
