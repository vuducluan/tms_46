class Course < ActiveRecord::Base
  enum status: [:inactive, :active, :finish]
  has_many :user_courses
  has_many :users, through: :user_courses, dependent: :destroy
  has_many :course_subjects
  has_many :subjects, through: :course_subjects, dependent: :destroy
  validates :name, presence: true
  validates :instruction, presence: true

  accepts_nested_attributes_for :user_courses, allow_destroy: true, reject_if:
    proc {|attributes| attributes[:_destroy].blank?}
  accepts_nested_attributes_for :course_subjects, allow_destroy: true,
    reject_if: proc {|a| a[:_destroy].blank?}

  def has_user? user
    self.users.include? user
  end

  def has_subject? subject
    self.subjects.include? subject
  end

  def user_course_of user
    self.user_courses.find_by user_id: user.id
  end

  def course_subject_of subject
    self.course_subjects.find_by subject_id: subject.id
  end

  def create_course_by user
    Course.transaction do
      begin
        self.save!
        self.user_courses.create! user_id: user.id
        return true
      rescue
        raise ActiveRecord::Rollback
        return false
      end
    end
  end
end
