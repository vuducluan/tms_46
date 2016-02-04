class UserSubjectsController < ApplicationController
  load_and_authorize_resource

  def update
    if @user_subject.update_attributes user_subject_params
      flash[:success] = t "flash.subject_success"
    else
      flash[:warning] = t "flash.subject_warning"
    end
    redirect_to :back
  end

  private

  def user_subject_params
    params.require(:user_subject).permit :status
  end
end
