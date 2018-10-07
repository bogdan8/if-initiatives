class AddMapAttributesToInitiative < ActiveRecord::Migration[5.1]
  def change
    add_column :initiatives, :longitude, :float
    add_column :initiatives, :latitude, :float
  end
end
