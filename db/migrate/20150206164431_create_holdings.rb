class CreateHoldings < ActiveRecord::Migration
  def change
    create_table :holdings do |t|
      t.integer :card_id
      t.integer :appearance_id
      t.boolean :played?, default: false

      t.timestamps
    end
  end
end
