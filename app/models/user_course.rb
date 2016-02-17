class UserCourse < ActiveRecord::Base
  enum status: [:active, :finished]

  belongs_to :user
  belongs_to :course
end
