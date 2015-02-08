class CreateCastVotes < ActiveRecord::Migration

  def change
    create_table :cast_votes do |t|
      t.references :appearance
      t.references :play
    end
  end

end
