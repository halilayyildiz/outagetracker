class CreateOutages < ActiveRecord::Migration
  def change
    create_table :outages do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
