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

end
