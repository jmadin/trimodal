class AddAcceptableToAreas < ActiveRecord::Migration
  def change
    add_column :areas, :acceptable, :boolean

  end
end
