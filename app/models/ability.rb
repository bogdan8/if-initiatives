# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :moderator
      can :manage, Initiative, Category
    elsif user.has_role? :user
      can :read, Initiative, user_id: user.id
      can :read, User, id: user.id
      cannot :manage, Category
      cannot :manage, User
    else
      can :read, :all
    end
  end
end
