class Ability
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new # guest user
 
    if user.role == 'admin'
      can :manage, :all
    elsif user.role == nil
      can :read, :all
      can :manage, Profile, :user_id => user.id
      can :manage, Media, :user_id => user.id
    end
  end
end