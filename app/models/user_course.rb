class UserCourse < ActiveRecord::Base
  enum status: [:active, :finished]

  belongs_to :user
  belongs_to :course

  before_create :add_user_course
  before_destroy :remove_user_course

  private
  def add_user_course
    course_subjects = course.course_subjects
    UserSubject.transaction do
      course_subjects.each do |course_subject|
        user_subject = user.user_subjects.build course_subject: course_subject
        unless user_subject.save
          errors[:base] << "error"
          raise ActiveRecord::Rollback
        end
      end
    end
  end

  def remove_user_course
    course_subjects = course.course_subjects
    UserSubject.transaction do
      course_subjects.each do |course_subject|
        user_subject = user.user_subjects.find_by(course_subject_id: course_subject.id)
        unless user_subject.nil? || user_subject.destroy
          errors[:base] << "error"
          raise ActiveRecord::Rollback
        end
      end
    end
  end
end
