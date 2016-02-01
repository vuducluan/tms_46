class Course < ActiveRecord::Base
  enum status: [:inactive, :active, :finish]
  has_many :user_courses
  has_many :users, through: :user_courses, dependent: :destroy
  has_many :course_subjects
  has_many :subjects, through: :course_subjects, dependent: :destroy
end
