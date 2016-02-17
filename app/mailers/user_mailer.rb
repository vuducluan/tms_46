class UserMailer < ApplicationMailer

  def report_day_by_day user_name, user_email, subject_name, course_name, task_name
    @greeting = t "hi", user_name: user_name
    mail to: user_email, subject: t("user_mailer.report_day_by_day.subject",
      task_name: task_name, subject_name: subject_name,
      course_name: course_name)
  end

  def send_email_to_trainee user, course, added
    @greeting = t "hi", user_name: user.name
    type = added ? t("add_to") : t("remove_from")
    mail to: user.email, subject: t("user_mailer.send_email_to_trainee.subject",
      type: type, course_name: course.name)
  end
end
