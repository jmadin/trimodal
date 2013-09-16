class AddUsernameToSpawner < ActiveRecord::Migration
  def change
    add_column :spawners, :person_id, :integer
    add_index :spawners, :person_id
  end
end
