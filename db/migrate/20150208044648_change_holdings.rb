class ChangeHoldings < ActiveRecord::Migration
  def change
    rename_column :holdings, :played?, :played
  end
end
