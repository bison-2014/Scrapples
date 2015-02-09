class CastVote < ActiveRecord::Base
  belongs_to :voter, class_name: "Appearance"
  belongs_to :play
  # belongs_to :round, through: :play

  validates_uniqueness_of :play_id, :scope => [:voter_id]

  after_create :inform_round, :inform_appearance

  def inform_round
    self.play.round.register_vote
  end

  def inform_appearance
    self.play.appearance.register_vote
  end
end