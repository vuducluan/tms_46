class TraineeWorker
  include Sidekiq::Worker

  def perform user_id, course_id, added
    user = User.find user_id
    course = Course.find course_id
    UserMailer.send_email_to_trainee(user, course, added).deliver
  end
end
