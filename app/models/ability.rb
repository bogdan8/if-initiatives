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
      cannot :read, :all
      can :read, Initiative
      can %i[create], Subscription
    end
  end

  def for_moderator
    can :manage, Initiative
    can :manage, Category
    can :manage, Comment
    can :manage, Subscription
  end

  def for_user(user)
    cannot :manage, Category
    cannot :manage, User
    can :manage, Attachment, initiative: { user_id: user.id }
    can :manage, Attachment, report: { initiative: { user_id: user.id } }
    can :read, Initiative
    can :read, Report
    can :read, Subscription
    can :manage, Initiative, user_id: user.id
    can :manage, Report, initiative: { user_id: user.id }
    can :read, User
    can %i[edit update], User, id: user.id
    can :manage, Comment, user_id: user.id
    can %i[create], Subscription
  end
end
