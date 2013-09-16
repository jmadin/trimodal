class AddTouchNumberToTouches < ActiveRecord::Migration
  def change
    rename_column :touches, :type, :touch_type
  end
end
