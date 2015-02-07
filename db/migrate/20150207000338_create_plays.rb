class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.integer :appearance_id
      t.integer :card_id
      t.integer :round_id
      t.integer :votes, default: 0

      t.timestamps
    end
  end
end