class RemovePayerIdFromDonation < ActiveRecord::Migration[5.1]
  def change
    remove_column :donations, :payer_id
  end
end
