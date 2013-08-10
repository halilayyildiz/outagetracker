class AddUserTable < ActiveRecord::Migration
  def change
    create_table :user do |t|
      t.string :installation_id
      t.string :push_id

      t.timestamps
    end
  end
end
