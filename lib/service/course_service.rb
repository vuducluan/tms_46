require "singleton"
class CourseService
  include Singleton

  def create_course_by course, user
    Course.transaction do
      begin
        course.save!
        course.user_courses.create! user_id: user.id
        return true
      rescue
        raise ActiveRecord::Rollback
        return false
      end
    end
  end
end
