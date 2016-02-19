class Admin::TraineesController < ApplicationController
  load_and_authorize_resource :course

  def index
    @q = User.trainee_users.search params[:q]
    @users = @q.result.page(params[:page]).per Settings.per_page
    respond_to do |format|
      format.html
      format.js
    end
  end
end
