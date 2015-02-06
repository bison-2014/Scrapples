class Appearance < ActiveRecord::Base

  belongs_to :player, class_name: 'User'
  belongs_to :game

  has_many :holdings
  has_many :drawn_cards, through: :holdings, source: :card

  has_many :rounds, through: :game

  validates_presence_of :player
  validates_presence_of :game

  validates :player, uniqueness: { scope: :game,
  message: "must be unique for each game" }

  after_create :draw_hand

  def draw_card!
    card = self.game.cards_not_drawn.sample
    self.holdings.create(card: card)
    card
  end

  def incremement_point!
    self.points += 1
  end

  def held_cards
    self.drawn_cards.where(holdings: { played?: false} )
  end

  def played_cards
    self.drawn_cards.where(holdings: { played?: true} )
  end

  private

  def draw_hand
    7.times { draw_card! }
  end
end
