class CreateVoicemails < ActiveRecord::Migration
  def change
    create_table :voicemails do |t|
      t.string :audio
      t.references :connection, index: true, foreign_key: true
      t.datetime :created_at
      t.boolean :has_been_listened

      t.timestamps null: false
    end
  end
end
