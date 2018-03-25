class CreateInitiatives < ActiveRecord::Migration[5.1]
  def change
    create_table :initiatives do |t|
      t.string :title
      t.string :slug
      t.text :short_description
      t.text :long_description
      t.integer :sum
      t.date :finished_date
      t.integer :collected_amount

      t.timestamps
    end
  end
end
