require "singleton"
class UserCourseService
  include Singleton

  def add_trainee_to_course user_course
    TraineeWorker.perform_async user_course.user.id, user_course.course.id, true
  end

  def remove_trainee_from_course user_course
    TraineeWorker.perform_async user_course.user.id, user_course.course.id, false
  end
end
