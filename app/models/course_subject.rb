class CourseSubject < ActiveRecord::Base
  enum status: [:inactive, :active, :finished]
  belongs_to :course
  belongs_to :subject
end
