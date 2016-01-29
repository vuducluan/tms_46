class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.supervisor?
      can :manage, :all
    else
      can :read, User, role: "trainee"
      can :read, Course
    end
  end
end
