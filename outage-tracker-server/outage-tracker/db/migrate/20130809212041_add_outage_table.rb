class AddOutageTable < ActiveRecord::Migration
  def change
    create_table :outages do |t|
      t.string :outage_id
      t.string :description
      t.string :location
      t.datetime :start_date
      t.datetime :end_date
      t.string :address
      t.integer :affected_customers

      t.timestamps
    end
  end
end

