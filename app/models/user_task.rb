class UserTask < ActiveRecord::Base
  belongs_to :user
  belongs_to :course_subject_task

  after_create :create_user_activity_task

  private
  def create_user_activity_task
    UserTaskService.instance.create_user_activity_task self
  end
end
