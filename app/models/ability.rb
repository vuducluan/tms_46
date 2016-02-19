class Ability
  include CanCan::Ability

  def initialize user, controller_namespace
    user ||= User.new

    if user.supervisor?
      can :manage, :all
      cannot :read, User, role: 1
    elsif controller_namespace == "Admin"
      cannot :read, :all
    else
      can :index, User, role: 0
      can :show, User do |u|
        u.trainee?
      end
      can :index, Course, status: 1
      can :show, Course do |course|
        course.active?
      end
      can :read, CourseSubject
      can :show, CourseSubject do |course_subject|
        course_subject.active?
      end
      can :update, User, id: user.id
      can :update, UserSubject
    end
  end
end
