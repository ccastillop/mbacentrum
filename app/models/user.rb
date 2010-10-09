class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :devise_oauth2_facebook

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_one :profile
  has_many :medias

  def to_s
    return email unless profile
    return profile.to_s
  end
  
  def admin?
    role == "admin"
  end

  def user?
    role == "user"
  end
  
end
