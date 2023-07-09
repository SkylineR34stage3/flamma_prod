# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all  # allow everyone to read everything
    return unless user.present?  # additional permissions for logged in users (they can manage their posts)
    can :manage, Post, user_id: user.id

    if user.admin?  # additional permissions for administrators
      can :manage, :all
    end
  end
end
