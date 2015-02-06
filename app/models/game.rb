class Game < ActiveRecord::Base

    has_many :appearances
    has_many :rounds

    has_many :players, through: :appearances
    has_many :holdings, through: :appearances
    has_many :drawn_cards, through: :holdings, source: :card


    after_create :create_first_round

    def cards_not_drawn
      drawn_cards = self.drawn_cards.all # precache list of all cards.  The "#all" is required to prevent us from querying the database a million times.
      Card.all.reject { |card| drawn_cards.include? card }
    end

    private

    def create_first_round
      self.rounds.create!
    end
end
