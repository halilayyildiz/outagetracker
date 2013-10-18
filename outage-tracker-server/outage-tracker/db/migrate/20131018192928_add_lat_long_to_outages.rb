class AddLatLongToOutages < ActiveRecord::Migration
  def self.up
    add_column :outage, :lat, :float
    add_column :outage, :long, :float
  end
end
