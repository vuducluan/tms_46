class CourseSubject < ActiveRecord::Base
  enum status: [:inactive, :active, :finished]
  belongs_to :course
  belongs_to :subject

  has_many :course_subject_tasks, dependent: :destroy
  has_many :tasks, through: :course_subject_tasks, dependent: :destroy
  has_many :user_subjects, dependent: :destroy
  has_many :users, through: :user_subjects, dependent: :destroy


  accepts_nested_attributes_for :user_subjects, allow_destroy: true

  scope :by_user, ->(user_id){where Settings.course_subject.QUERY, user_id: user_id}
  scope :actived, ->{where status: CourseSubject.statuses[:active]}

  after_create :create_course_subject_tasks, :add_user_subjects

  def has_user? user
    users.include? user
  end

  def user_subject_of user
    user_subjects.find_by user_id: user.id
  end

  private

  def create_course_subject_tasks
    CourseSubjectService.instance.create_course_subject_tasks self
  end

  def add_user_subjects
    users = self.course.users.trainee_users
    UserSubject.transaction do
      begin
        users.each do |user|
          self.user_subjects.create user_id: user.id
        end
      rescue
        raise ActiveRecord::Rollback
      end
    end
  end
end
