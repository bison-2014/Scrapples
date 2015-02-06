class Holding < ActiveRecord::Base

  belongs_to :card
  belongs_to :appearance

  has_one :game, through: :appearance
  has_one :player, through: :appearances

  validates_presence_of :card, :appearance
end
