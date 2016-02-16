class UserMailer < ApplicationMailer

  def report_day_by_day user_name, user_email, subject_name, course_name, task_name
    @greeting = t "hi", user_name: user_name
    mail to: user_email, subject: t("user_mailer.report_day_by_day.subject",
      task_name: task_name, subject_name: subject_name,
      course_name: course_name)
  end
end
