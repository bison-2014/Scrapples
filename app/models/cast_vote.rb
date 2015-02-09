class CastVote < ActiveRecord::Base
  belongs_to :voter, class_name: "Appearance"
  belongs_to :play


  validates_uniqueness_of :play_id, :scope => [:voter_id]


end