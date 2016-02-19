class CoursesController < ApplicationController
  load_and_authorize_resource

  def index
    @courses = @courses.page(params[:page]).per Settings.per_page
  end

  def show
    @course_subjects = @course.course_subjects.actived.by_user(current_user.id).page(params[:page]).per Settings.per_page
  end
end
