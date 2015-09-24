class CreateAnsweringMachines < ActiveRecord::Migration
  def change
    create_table :answering_machines do |t|
      t.string :url

      t.timestamps null: false
    end
  end
end
