class Subject < ActiveRecord::Base
  has_many :user_subjects
  has_many :users, through: :user_subjects, dependent: :destroy
  has_many :course_subjects
  has_many :courses, through: :course_subjects, dependent: :destroy
  has_many :tasks, dependent: :destroy
end
