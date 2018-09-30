class AddMapAttributesToInitiative < ActiveRecord::Migration[5.1]
  def change
    add_column :initiatives, :longitude, :text
    add_column :initiatives, :latitude, :text
  end
end
