class UserSubject < ActiveRecord::Base
  belongs_to :user
  belongs_to :course_subject
  after_update :create_user_task

  def create_user_task
    @course_subject_tasks = course_subject.course_subject_tasks
    @course_subject_tasks.each do |course_subject_task|
      user.user_tasks.create course_subject_task_id: course_subject_task.id unless user.has_course_subject_task? course_subject_task
    end
  end
end
