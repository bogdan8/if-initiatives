class CreateSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :steps do |t|
      t.string :state
      t.references :initiative, foreign_key: true

      t.timestamps
    end
  end
end
