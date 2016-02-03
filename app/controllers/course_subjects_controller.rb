class CourseSubjectsController < ApplicationController
  load_and_authorize_resource

  def show
    @course_subject_tasks = @course_subject.course_subject_tasks
  end
end
