class AddMaxRoundsToGame < ActiveRecord::Migration
  def change
    add_column :games, :max_rounds, :integer
  end
end
