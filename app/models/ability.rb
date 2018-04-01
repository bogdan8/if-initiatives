# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :moderator
      can :manage, Initiative, Category, Comment
    elsif user.has_role? :user
      cannot :manage, Category
      cannot :manage, User
      can :read, Initiative
      can :manage, Initiative, user_id: user.id
      can :read, User
      can %i[edit update], User, id: user.id
      can :manage, Comment, id: user.id
    else
      cannot :manage, :all
      can :read, Initiative
    end
  end
end
