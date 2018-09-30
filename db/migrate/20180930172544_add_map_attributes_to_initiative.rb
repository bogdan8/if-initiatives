class AddMapAttributesToInitiative < ActiveRecord::Migration[5.1]
  def change
    add_column :initiatives, :longitude, :string
    add_column :initiatives, :latitude, :string
  end
end
