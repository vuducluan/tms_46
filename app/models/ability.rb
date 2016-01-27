class Ability
  include CanCan::Ability

  def initialize user
    user || User.new
    if user.supervisor?
      can :manage, :all
    else
      can :read, :all
      can :edit, :update, User, id: user.id
    end
  end
end
