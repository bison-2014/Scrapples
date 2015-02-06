class User < ActiveRecord::Base

  has_many :appearances
  has_many :games, through: :appearances
  has_many :rounds, through: :games

  has_secure_password
  before_save { self.email = email.downcase }

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :name, presence: true
  validates :email, presence: true, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  validates :password, confirmation: true
  validates_length_of :password, :in => 6..20 #, :on => :create #and on update
end
