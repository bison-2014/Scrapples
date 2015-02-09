class ChangeAppearanceIdNameInCastVotes < ActiveRecord::Migration
  def change
    rename_column :cast_votes, :appearance_id, :voter_id
  end
end
