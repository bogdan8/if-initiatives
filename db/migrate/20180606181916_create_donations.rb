class CreateDonations < ActiveRecord::Migration[5.1]
  def change
    create_table :donations do |t|
      t.integer :payer_id
      t.references :user, foreign_key: true
      t.references :initiative, foreign_key: true
      t.integer :amount
      t.string :description
      t.string :currency
      t.string :internet_banking

      t.timestamps
    end
  end
end
