class PostmanWorker
  include Sidekiq::Worker

  def perform user_id, course_subject_id, task_id
    user = User.find user_id
    course_subject = CourseSubject.find course_subject_id
    task = Task.find task_id
    UserMailer.report_day_by_day(user.name, user.email, course_subject.subject.
      name, course_subject.course.name, task.name).deliver
  end
end
