class Course < ActiveRecord::Base
  enum status: [:inactive, :active, :finish]
  has_many :user_courses
  has_many :users, through: :user_courses, dependent: :destroy
  has_many :course_subjects
  has_many :subjects, through: :course_subjects, dependent: :destroy

  accepts_nested_attributes_for :user_courses, allow_destroy: true, reject_if:
    proc {|attributes| attributes[:_destroy].blank?}

  def has_user? user
    self.users.include? user
  end

  def user_course_of user
    self.user_courses.find_by user_id: user.id
  end
end
