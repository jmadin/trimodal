class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.text :address
      t.string :email
      t.string :phone
      t.string :role
      t.text :notes

      t.timestamps
    end
  end
end
