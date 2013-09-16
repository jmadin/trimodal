class AddAcceptableOutlineToAreas < ActiveRecord::Migration
  def change
    add_column :areas, :acceptable_outline, :boolean

  end
end
