class AddPerimeterToAreas < ActiveRecord::Migration
  def change
    add_column :areas, :perimeter, :decimal
  end
end
