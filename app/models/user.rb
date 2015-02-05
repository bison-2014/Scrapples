class User < ActiveRecord::Base
  has_secure_password
  before_save { self.email = email.downcase }

  # EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :name, presence: true
  validates :email, presence: true, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  validates :password, confirmation: true 
  validates_length_of :password, :in => 6..20, :on => :create

end

# include session helper? better way to do it?
# def set_current_user
#   User.current = (session[:user_id]) ? User.find_by_id(session[:user_id]) : nil
# end
