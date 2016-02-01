class Admin::CoursesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def update
    if @course.update_attributes course_params
      flash[:success] = t "users.update_success"
    else
      flash[:warning] = t "users.update_failed"
    end
    redirect_to :back
  end

  def show
    @course_subjects = @course.course_subjects
    @subjects = @course.subjects.page(params[:page]).per Settings.per_page
  end

  private
  def course_params
    params.require(:course).permit :id, :name, :instruction,
      user_courses_attributes: [:id, :user_id, :course_id, :_destroy]
  end
end
