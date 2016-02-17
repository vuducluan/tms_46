class CourseSubject < ActiveRecord::Base
  enum status: [:inactive, :active, :finished]
  belongs_to :course
  belongs_to :subject

  has_many :course_subject_tasks, dependent: :destroy
  has_many :tasks, through: :course_subject_tasks, dependent: :destroy
  has_many :user_subjects, dependent: :destroy
  has_many :users, through: :user_subjects, dependent: :destroy

  accepts_nested_attributes_for :user_subjects, allow_destroy: true

  after_create ->{CourseSubjectService.instance.create_course_subject_tasks self}

  scope :by_user, ->(user_id){where Settings.course_subject.QUERY, user_id: user_id}

  def has_user? user
    users.include? user
  end

  def user_subject_of user
    user_subjects.find_by user_id: user.id
  end
end
