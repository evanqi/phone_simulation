class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :state
      t.string :incoming_url
      t.integer :incoming_phone_num
      t.integer :incoming_caller_id

      t.timestamps null: false
    end
  end
end
