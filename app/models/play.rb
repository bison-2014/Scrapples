class Play < ActiveRecord::Base
  belongs_to :round
  belongs_to :card
  belongs_to :appearance
  has_one :game, through: :round

  has_many :cast_votes

  validates_presence_of :appearance, :card, :round

end