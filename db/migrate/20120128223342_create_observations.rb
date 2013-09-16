class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.references :coral
      t.references :fieldtrip
      t.integer :mother_id
      t.integer :tag_number
      t.string :action

      t.timestamps
    end
    add_index :observations, :coral_id
    add_index :observations, :fieldtrip_id
  end
end
