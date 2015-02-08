class Round < ActiveRecord::Base

  belongs_to :game

  has_many :appearances, through: :game
  has_many :players, through: :appearances
  has_many :cast_votes, through: :plays
  has_many :plays


  validates_presence_of :game


end
