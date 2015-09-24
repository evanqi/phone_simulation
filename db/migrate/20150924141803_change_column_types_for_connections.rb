class ChangeColumnTypesForConnections < ActiveRecord::Migration
  def change
    change_column :connections, :incoming_phone_num, :string
    change_column :connections, :incoming_caller_id, :string
  end
end
