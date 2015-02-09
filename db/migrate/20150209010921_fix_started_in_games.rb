class FixStartedInGames < ActiveRecord::Migration
  def change
    remove_column :rounds, :started?
    add_column :games, :started?, :boolean, default: false
  end
end
