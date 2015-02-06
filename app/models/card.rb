class Card < ActiveRecord::Base
  has_many :holdings
  has_many :plays
  # has_many :played_rounds, through: :plays
  
  validates :name, :bio, presence: true, on: :create
  validates_uniqueness_of :name
  
end