class Admin::CoursesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
    @course_subjects = @course.course_subjects
    @subjects = @course.subjects.page(params[:page]).per Settings.per_page
  end
end
