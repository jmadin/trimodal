class CreateFieldtrips < ActiveRecord::Migration
  def change
    create_table :fieldtrips do |t|
      t.string :name
      t.string :name_code
      t.date :date
      t.text :description

      t.timestamps
    end
  end
end
