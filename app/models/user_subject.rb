class UserSubject < ActiveRecord::Base
  belongs_to :user
  belongs_to :course_subject
end
