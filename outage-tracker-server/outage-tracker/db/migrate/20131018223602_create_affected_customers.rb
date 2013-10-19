class CreateAffectedCustomers < ActiveRecord::Migration
  def change
    create_table :affected_customers do |t|
      t.string :inst_id
      t.string :outage_id

      t.timestamps
    end
  end
end
