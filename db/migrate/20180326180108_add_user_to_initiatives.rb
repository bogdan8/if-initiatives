class AddUserToInitiatives < ActiveRecord::Migration[5.1]
  def change
    add_reference :initiatives, :user, foreign_key: true
  end
end
