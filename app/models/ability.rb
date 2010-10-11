class Ability
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new # guest user
 
    if user.admin?
      can :manage, :all
    elsif user.mba?
      can :read, :all
      can :create,[ Profile, Media, Comentario]
      can [:update, :destroy], Profile do |p|
        p.mba == user.profile.mba || p.user == user
      end
      can [:update, :destroy], Media do |p|
        p.user.profile.mba == user.profile.mba || p.user == user
      end
      can [:update, :destroy], Comentario do |p|
        p.user.profile.mba == user.profile.mba || p.user == user
      end
      can :manage, User do |u|
        u.try(:profile).try(:mba) == user.profile.mba
      end
    elsif user.user?
      can :read, :all
      can :create,[ Profile, Media, Comentario]
      can [:update, :destroy], [ Profile, Media, Comentario], :user_id => user.id
    else
      can :read, Mba
      can :create, Profile
      can [:read, :update, :destroy], Profile, :user_id => user.id
    end
  end
end