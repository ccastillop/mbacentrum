class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
        :recoverable, :rememberable, :trackable, :validatable, 
        :devise_oauth2_facebook#, :validate_on_invite => true
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_one :profile
  has_many :medias
  has_many :comentarios

  def to_s
    return email unless profile
    return profile.to_s
  end
  
  ROLES=["user","mba","admin"]

  def user?
    role == ROLES[0]
  end

  def mba?
    role == ROLES[1]
  end
  
  def admin?
    role == ROLES[2]
  end
  
  protected
    def password_required?
     !persisted? || password.present? || password_confirmation.present?
   end    
end
