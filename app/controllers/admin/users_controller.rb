class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @q = @users.search params[:q]
    @users = @q.result.page(params[:page]).per Settings.per_page
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    if @user.save
      flash[:success] = t "users.create_success"
      redirect_to [:admin, @user]
    else
      flash[:warning] = t "users.create_failed"
      redirect_to new_admin_user_url
    end
  end

  def new
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "users.update_success"
      redirect_to [:admin, @user]
    else
      flash[:warning] = t "users.update_failed"
      redirect_to edit_admin_user_path @user
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "users.delete_success"
    else
      flash[:danger] = t "users.delete_failed"
    end
    redirect_to [:admin, :users]
  end

  def show
    @courses = @user.courses
  end

  private
  def user_params
    params.require(:user).permit :id, :name, :email, :password, :password_confirmation, :role
  end
end
