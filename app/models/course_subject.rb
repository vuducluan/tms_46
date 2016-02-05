class CourseSubject < ActiveRecord::Base
  enum status: [:inactive, :active, :finished]
  belongs_to :course
  belongs_to :subject

  has_many :course_subject_tasks, dependent: :destroy
  has_many :tasks, through: :course_subject_tasks, dependent: :destroy
  has_many :user_subjects
  has_many :users, through: :user_subjects, dependent: :destroy

  accepts_nested_attributes_for :user_subjects, allow_destroy: true

  after_create :create_course_subject_tasks

  def has_user? user
    users.include? user
  end

  def user_subject_of user
    user_subjects.find_by user_id: user.id
  end

  private
  def create_course_subject_tasks
    tasks = self.subject.tasks
    tasks.each do |task|
      self.course_subject_tasks.create task_id: task.id
    end
  end
end
