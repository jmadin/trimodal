class AddGrowthFormToTouches < ActiveRecord::Migration
  def change
    add_column :touches, :growth_form, :string

  end
end
