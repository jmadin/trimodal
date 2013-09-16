class CreateFecundCorals < ActiveRecord::Migration
  def change
    create_table :fecund_corals do |t|
      t.references :fieldtrip
      t.string :species
      t.string :species_code
      t.integer :dim_1
      t.integer :dim_2
      t.string :habitat
      t.string :outliner_name
      t.string :outline_filename
      t.decimal :area
      t.boolean :flag
      t.text :notes

      t.timestamps
    end
    add_index :fecund_corals, :fieldtrip_id
  end
end
