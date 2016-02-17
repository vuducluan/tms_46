class UserCourse < ActiveRecord::Base
  enum status: [:active, :finished]
  belongs_to :user
  belongs_to :course

  # after_create :add_trainee_to_course
  # after_destroy :remove_trainee_from_course

  # private
  # def add_trainee_to_course
  #   TraineeWorker.perform_async user.id, course.id, true
  # end

  # def remove_trainee_from_course
  #   TraineeWorker.perform_async user.id, course.id, false
  # end
end
