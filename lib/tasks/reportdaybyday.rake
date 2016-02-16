namespace :reportdaybyday do
  desc "TODO"

  task report_day_by_day: :environment do
    UserTask.all.each do |user_task|
      task = user_task.course_subject_task.task
      course_subject = user_task.course_subject_task.course_subject
      user = user_task.user
      PostmanWorker.perform_async user.id, course_subject.id, task.id
    end
  end
end
