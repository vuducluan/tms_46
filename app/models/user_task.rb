class UserTask < ActiveRecord::Base
  belongs_to :user
  belongs_to :course_subject_task

  after_create :create_user_activity_task

  private
  def create_user_activity_task
    user.activities.create user: user, target: course_subject_task.task.id,
      type_activity: 0, user_name: user.name
  end
end
