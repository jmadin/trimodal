class CreateCorals < ActiveRecord::Migration
  def change
    create_table :corals do |t|
      t.integer :transect
      t.integer :map_x
      t.integer :map_y
      t.integer :dim_1
      t.integer :dim_2
      t.string :species
      t.string :species_code
      t.text :notes

      t.timestamps
    end
  end
end
