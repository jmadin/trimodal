class ChangeNameTypeToTouchTypeInTouches2 < ActiveRecord::Migration
  def change
    rename_column :touches, :type, :touch_type
  end
end
