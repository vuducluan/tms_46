class Activity < ActiveRecord::Base
  enum type_activity: [:task_type, :subject_type]
  belongs_to :user
end
