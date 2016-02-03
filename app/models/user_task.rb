class UserTask < ActiveRecord::Base
  belongs_to :user
  belongs_to :course_subject_task
end
