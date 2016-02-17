class UserCourse < ActiveRecord::Base
  enum status: [:active, :finished]

  belongs_to :user
  belongs_to :course

  after_create -> {UserCourseService.instance.add_trainee_to_course self}
  after_destroy -> {UserCourseService.instance.remove_trainee_from_course self}
end
