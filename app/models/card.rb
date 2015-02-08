class Card < ActiveRecord::Base
  has_many :holdings
  has_many :plays

  
  validates :name, :bio, presence: true, on: :create
  
end