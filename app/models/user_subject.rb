class UserSubject < ActiveRecord::Base
  enum status: [:open, :finished]

  belongs_to :user
  belongs_to :course_subject

  scope :user_course_subject, ->(course_id){where Settings.user_course_subject,
    course_id: course_id}
  scope :status, ->{where status: :finished}
end
