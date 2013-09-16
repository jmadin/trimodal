class CreateTouches < ActiveRecord::Migration
  def change
    create_table :touches do |t|
      t.references :area
      t.string :outliner_name
      t.string :outline_filename
      t.string :taxon1
      t.string :taxon2
      t.string :type
      t.decimal :length
      t.boolean :flag
      t.text :notes

      t.timestamps
    end
    add_index :touches, :area_id
  end
end
