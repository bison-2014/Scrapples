class CastVote < ActiveRecord::Base
  belongs_to :appearance
  belongs_to :play
  
  
  validates_uniqueness_of :play_id, :scope => [:appearance_id]
  
  
end