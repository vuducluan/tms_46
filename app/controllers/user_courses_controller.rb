class UserCoursesController < ApplicationController
  load_and_authorize_resource :course

  def index
    @users = @course.users.page(params[:page]).per Settings.per_page
  end
end
