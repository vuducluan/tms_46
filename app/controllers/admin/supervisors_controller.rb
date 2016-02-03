class Admin::SupervisorsController < ApplicationController
  load_and_authorize_resource :course

  def index
    @users = User.supervisor_users.page(params[:page]).per Settings.per_page
  end
end
