class CoursesController < ApplicationController
  load_and_authorize_resource

  def index
    @courses = @courses.page(params[:page]).per Settings.per_page
  end

  def show
    @subjects = @course.subjects.page(params[:page]).per Settings.per_page
  end
end
