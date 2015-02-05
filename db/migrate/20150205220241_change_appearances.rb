class ChangeAppearances < ActiveRecord::Migration
  def change
    change_column_default :appearances, :points, 0
  end
end
