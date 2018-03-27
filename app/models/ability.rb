class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.moderator?
      can :manage, Initiative, Category
    elsif user.user?
      can :read, Initiative, user_id: user.id
      can :read, User, id: user.id
      cannot :manage, Category
      cannot :manage, User
    else
      can :read, :all
    end
  end
end
