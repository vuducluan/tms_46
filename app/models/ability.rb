class Ability
  include CanCan::Ability

  def initialize user, controller_namespace
    user ||= User.new

    if user.supervisor?
      can :manage, :all
      cannot :create, User, role: "supervisor"
    elsif controller_namespace == "Admin"
      cannot :read, :all
    else
      can :read, User, role: "trainee"
      can :read, Course
      can :read, CourseSubject
      can :update, User, id: user.id
    end
  end
end
