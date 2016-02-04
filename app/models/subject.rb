class Subject < ActiveRecord::Base
  has_many :course_subjects
  has_many :courses, through: :course_subjects, dependent: :destroy

  validates :name, presence: true
  validates :instruction, presence: true
end
