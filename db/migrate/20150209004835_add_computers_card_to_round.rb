class AddComputersCardToRound < ActiveRecord::Migration
  def change
    add_column :rounds, :computers_card_id, :integer
  end
end
