require "singleton"

class UserTaskService
  include Singleton

  def create_user_activity_task user_task
    user = user_task.user
    user.activities.create user: user, target: user_task.course_subject_task.
      task.id, type_activity: 0, user_name: user.name
  end
end
