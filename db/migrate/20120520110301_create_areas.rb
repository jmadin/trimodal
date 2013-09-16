class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.references :observation
      t.string :outliner_name
      t.string :outline_filename
      t.decimal :area
      t.boolean :flag
      t.text :notes

      t.timestamps
    end
    add_index :areas, :observation_id
  end
end
