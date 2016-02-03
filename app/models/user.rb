class User < ActiveRecord::Base
  enum role: [:trainee, :supervisor]
  devise :database_authenticatable, :registerable, :rememberable, :validatable,
    :timeoutable
  has_many :user_courses
  has_many :courses, through: :user_courses, dependent: :destroy
  has_many :user_subjects
  has_many :subjects, through: :user_subjects, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :user_tasks
  has_many :course_subject_tasks, through: :user_tasks, dependent: :destroy
  accepts_nested_attributes_for :user_courses, allow_destroy: true

  scope :supervisor_users, ->{where role: User.roles[:supervisor]}
  scope :trainee_users, ->{where role: User.roles[:trainee]}

  def has_course_subject_task? course_subject_task
    course_subject_tasks.include? course_subject_task
  end
end
