class CreateSpawners < ActiveRecord::Migration
  def change
    create_table :spawners do |t|
      t.references :fieldtrip
      t.string :species
      t.string :species_code
      t.integer :tag_number
      t.decimal :area
      t.text :notes

      t.timestamps
    end
    add_index :spawners, :fieldtrip_id
  end
end
