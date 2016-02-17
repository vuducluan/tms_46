require "singleton"
class CourseSubjectService
  include Singleton

  def create_course_subject_tasks course_subject
    tasks = course_subject.subject.tasks
    tasks.each do |task|
      course_subject.course_subject_tasks.create task_id: task.id
    end
  end
end
