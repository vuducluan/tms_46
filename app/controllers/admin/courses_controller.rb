class Admin::CoursesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def create
    created_course =  @course.create_course_by current_user
    if created_course
      flash[:success] = t "course.create_success"
      redirect_to [:admin, @course]
    else
      flash[:warning] = t "course.create_failed"
      redirect_to [:admin, :courses]
    end

  end

  def new
  end

  def edit
  end

  def update
    if @course.update_attributes course_params
      flash[:success] = t "course.update_success"
    else
      flash[:warning] = t "course.update_failed"
    end
    redirect_to [:admin, @course]
  end

  def destroy
    if @course.destroy
      flash[:success] = t "course.delete_success"
    else
      flash[:danger] = t "course.delete_failed"
    end
    redirect_to :back
  end

  def show
    @course_subjects = @course.course_subjects.page(params[:page]).per Settings.per_page
  end

  private
  def course_params
    params.require(:course).permit :id, :name, :instruction, :status,
      user_courses_attributes: [:id, :user_id, :course_id, :_destroy],
      course_subjects_attributes: [:id, :course_id, :subject_id, :_destroy]
  end
end
