class UserCoursesController < ApplicationController
  load_and_authorize_resource :course

  def index
    @users = @course.users
  end
end
