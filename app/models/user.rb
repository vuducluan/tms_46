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
  has_many :tasks, through: :user_tasks, dependent: :destroy

  def has_task? task
    tasks.include? task
  end
end
