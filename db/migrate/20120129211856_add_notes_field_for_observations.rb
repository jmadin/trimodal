class AddNotesFieldForObservations < ActiveRecord::Migration
  def up
    add_column :observations, :notes, :text
  end

  def down
    remove_column :observations, :notes
  end
end
