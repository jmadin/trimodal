class AddOutlinerNameToSpawners < ActiveRecord::Migration
  def change
    add_column :spawners, :outliner_name, :string

  end
end
