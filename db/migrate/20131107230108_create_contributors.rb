class CreateContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|
      t.string :first_name
      t.string :last_name
      t.string :short_name
      t.string :email
      t.string :phone
      t.string :institution
      t.string :country
      t.text :contributor_profile
      t.string :password_digest
      t.string :remember_token
      t.boolean :admin

      t.timestamps
    end
  end
end
