class Admin::SubjectsController < ApplicationController
  load_and_authorize_resource

  def index
    @subjects = @subjects.page(params[:page]).per Settings.per_page
  end

  def edit
  end

  def update
    if @subject.update_attributes subject_params
      flash[:success] = t "subject.update_success"
    else
      flash[:warning] = t "subject.update_failed"
    end
    redirect_to [:admin, @subject]
  end

  def show
  end

  def destroy
    if @subject.destroy
      flash[:success] = t "course.delete_success"
    else
      flash[:danger] = t "course.delete_failed"
    end
    redirect_to admin_subjects_url
  end

  def create
    if @subject.save
      flash[:success] = t "subject.create_success"
    else
      flash[:warning] = t "subject.create_failed"
    end
    redirect_to [:admin, @subject]
  end

  def new
  end

  private
  def subject_params
    params.require(:subject).permit :name, :instruction
  end
end
