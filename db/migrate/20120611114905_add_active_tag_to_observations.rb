class AddActiveTagToObservations < ActiveRecord::Migration
  def change
    add_column :observations, :active_tag, :integer

  end
end
