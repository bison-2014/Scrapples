class Game < ActiveRecord::Base

    has_many :appearances
    has_many :players, through: :appearances

    has_many :rounds

    after_create :create_first_round

    private

    def create_first_round
      self.rounds.create!
    end
end
