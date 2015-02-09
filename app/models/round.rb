class Round < ActiveRecord::Base

  belongs_to :game
  belongs_to :computers_card, class_name: "Card"


  has_many :appearances, through: :game
  has_many :players, through: :appearances
  has_many :cast_votes, through: :plays
  has_many :plays

  before_create :computer_draws_card

  validates_presence_of :game

  def update_status
    if self.plays.length >= self.appearances.length
      self.status = "waiting for votes"
      self.save
    end
  end

  def computer_draws_card
    drawn_cards = self.game.drawn_cards
    self.computers_card = Card.all.reject { |card| drawn_cards.include? card }.sample
  end

  def register_vote
    if self.cast_votes.count == self.appearances.count
      self.complete = true
      self.set_winner
      self.save
    end
  end

  def set_winner
    round_winner = Appearance.find_by(id: hashed_vote_counts.max[0])
    round_winner.incremement_point!
  end

  def hashed_vote_counts
    # grab all cast_votes and make a hash a la {player_id: voute_count}
    self.cast_votes.each_with_object({}) do |vote, vote_count_hash|
      vote_count_hash[vote.play_id] ? vote_count_hash[vote.play_id] += 1 : vote_count_hash[vote.play_id] = 1
      vote_count_hash
    end
  end
end
