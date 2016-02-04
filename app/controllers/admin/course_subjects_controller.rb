class Admin::CourseSubjectsController < ApplicationController
  load_and_authorize_resource :course

  def index
    @subjects = Subject.page(params[:page]).per Settings.per_page
    @course_subjects = @course.course_subjects
  end

  def show
  end

  def edit
  end

  def update
  end
end
