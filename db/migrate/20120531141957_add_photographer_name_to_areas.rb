class AddPhotographerNameToAreas < ActiveRecord::Migration
  def change
    add_column :areas, :photographer_name, :string

  end
end
