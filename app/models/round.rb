class Round < ActiveRecord::Base

  belongs_to :game

  has_many :appearances, through: :game
  has_many :players, through: :appearances

  validates :player_id, uniqueness: { scope: :game_id,
    message: "must be unique for each game" }

end
