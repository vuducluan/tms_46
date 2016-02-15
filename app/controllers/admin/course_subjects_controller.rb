class Admin::CourseSubjectsController < ApplicationController
  load_and_authorize_resource :course
  load_and_authorize_resource :course_subject, only: [:update, :show]

  def index
    @subjects = Subject.page(params[:page]).per Settings.per_page
    @course_subjects = @course.course_subjects
  end

  def show
    @users = @course_subject.course.users.trainee_users.page(params[:page]).per Settings.per_page
  end

  def update
    if @course_subject.update_attributes course_subject_params
      flash[:success] = t "update_success"
      redirect_to [:admin, @course_subject.course]
    else
      flash[:warning] = t "update_failed"
      redirect_to [:admin, @course_subject]
    end
  end

  private
  def course_subject_params
    params.require(:course_subject).permit :course_id, :subject_id, :status,
      user_subjects_attributes: [:id, :user_id, :course_subject_id, :_destroy]
  end
end
