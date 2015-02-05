class CreateAppearances < ActiveRecord::Migration
  def change
    create_table :appearances do |t|
      t.integer :player_id
      t.integer :game_id

      t.integer :points

      t.timestamps
    end
  end
end
