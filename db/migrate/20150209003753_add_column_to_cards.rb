class AddColumnToCards < ActiveRecord::Migration
  def change
    add_column :cards, :img_url, :string
  end
end
