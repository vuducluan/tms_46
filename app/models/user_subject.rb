class UserSubject < ActiveRecord::Base
  belongs_to :user
  belongs_to :course_subject
  after_update :create_user_task, :create_user_activity_subject

  private
  def create_user_task
    @course_subject_tasks = course_subject.course_subject_tasks
    @course_subject_tasks.each do |course_subject_task|
      unless user.has_course_subject_task? course_subject_task
        user.user_tasks.create course_subject_task: course_subject_task
      end
    end
  end

  def create_user_activity_subject
    user.activities.create user: user, target: course_subject.subject.id,
      type_activity: 1, user_name: user.name
  end
end
