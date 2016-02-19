class Admin::TraineesController < ApplicationController
  load_and_authorize_resource :course

  def index
    @users = User.trainee_users
    @q = @users.search params[:q]
    @users = @q.result.page(params[:page]).per Settings.per_page
  end
end
