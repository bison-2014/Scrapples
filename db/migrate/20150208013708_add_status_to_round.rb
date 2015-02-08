class AddStatusToRound < ActiveRecord::Migration
  def change
    add_column :rounds, :status, :string, default: "waiting for plays"
  end
end
