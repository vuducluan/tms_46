class CourseSubject < ActiveRecord::Base
  enum status: [:inactive, :active, :finished]
  belongs_to :course
  belongs_to :subject

  has_many :course_subject_tasks
  has_many :tasks, through: :course_subject_tasks, dependent: :destroy
  has_many :user_subjects
  has_many :user, through: :user_subjects, dependent: :destroy
end
