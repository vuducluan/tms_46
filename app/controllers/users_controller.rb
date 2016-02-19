class UsersController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def update
    if params[:user].present?
      if @user.update_attributes user_params
        flash[:success] = t "finish_task"
      else
        flash[:warning] = t "finish_task_error"
      end
    end
    redirect_to :back
  end

  private

  def user_params
    params.require(:user).permit user_tasks_attributes: [:user_id, :course_subject_task_id]
  end
end
