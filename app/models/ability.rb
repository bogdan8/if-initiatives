# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :administrator
      can :manage, :all
    elsif user.has_role? :moderator
      for_moderator
    elsif user.has_role? :user
      for_user(user)
    else
      cannot :manage, :all
      can :read, Initiative
    end
  end

  def for_moderator
    can :manage, Initiative
    can :manage, Category
    can :manage, Comment
  end

  def for_user(user)
    cannot :manage, Category
    cannot :manage, User
    can :read, Initiative
    can :manage, Initiative, user_id: user.id
    can :read, User
    can %i[edit update], User, id: user.id
    can :manage, Comment, id: user.id
  end
end
