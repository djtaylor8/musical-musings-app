# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new # guest user (not logged in)
      
      can :manage, User, id: user.id
      can :manage, Playlist, user_id: user.id
      can :read, Playlist, :all 
      can :manage, Comment, user_id: user.id 
      can :read, Comment, :all
  end
end
