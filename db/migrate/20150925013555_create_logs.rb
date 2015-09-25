class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.text :description

      t.timestamps null: false
    end
  end
end
