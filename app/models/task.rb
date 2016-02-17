class Task < ActiveRecord::Base
  has_many :course_subject_tasks
  has_many :course_subjects, through: :course_subject_tasks, dependent: :destroy

  belongs_to :subject

  validates :name, presence: true
end
