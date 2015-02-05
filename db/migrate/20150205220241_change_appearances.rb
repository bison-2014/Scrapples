class ChangeAppearances < ActiveRecord::Migration
  def change
    change_column_default :appearances, :score, 0
  end
end
