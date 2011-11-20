class AddLatitudeAndLongitudeToCamps < ActiveRecord::Migration
  def self.up
    add_column :camps, :latitude, :float
    add_column :camps, :longitude, :float
  end

  def self.down
    remove_column :camps, :latitude
    remove_column :camps, :longitude
  end
end
