require "singleton"
class UserSubjectService
  include Singleton

  def create_user_task user_subject
    course_subject_tasks = user_subject.course_subject.course_subject_tasks
    course_subject_tasks.each do |course_subject_task|
      unless user_subject.user.has_course_subject_task? course_subject_task
        user_subject.user.user_tasks.create course_subject_task:
          course_subject_task
      end
    end
  end

  def create_user_activity_subject user_subject
    user = user_subject.user
    user.activities.create user: user, target: user_subject.course_subject.subject.id,
      type_activity: 1, user_name: user.name
  end
end
