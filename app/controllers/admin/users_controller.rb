class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_admin
  current_section :admin

  def index
    @users = User.paginate(
      :page => params[:page],
      :order => "name DESC"
    )
  end

  def show
    @user = User.find(params[:id])

    if !@user
      redirect_to(admin_users_path, :alert => "User not found")
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to(admin_users_path, :notice => 'User was successfully created.')
    else
      render :action => :new
    end
  end

  def update
    @user = User.find(params[:id])

    # Don't include password if it wasn't specified
    if params[:user][:password].empty?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if @user.update_attributes(params[:user])
      redirect_to(admin_users_path, :notice => 'User was successfully updated.')
    else
      render :action => :edit
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy
    redirect_to(posts_url, :notice => "User was deleted successfully")
  end

  def sub_layout
    if ["new", "edit", "update", "create"].include?(action_name)
      "box"
    else
      "mainSidebar"
    end
  end
end
