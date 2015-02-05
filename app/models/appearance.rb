class Appearance < ActiveRecord::Base

    belongs_to :player, class_name: 'User'
    belongs_to :game

    has_many :rounds, through: :game

    def incremement_point!
        self.points += 1
    end
end
