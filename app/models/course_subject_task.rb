class CourseSubjectTask < ActiveRecord::Base
  belongs_to :course_subject
  belongs_to :task

  has_many :user_tasks
  has_many :users, through: :user_tasks, dependent: :destroy
end
