class Card < ActiveRecord::Base
  has_many :holdings
  has_many :plays
  # has_many :played_rounds, through: :plays
  validates_presence_of :name, :bio
  validates_uniqueness_of :name
  
end