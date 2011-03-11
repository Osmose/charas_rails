class Admin::ResourcesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_can_approve
  current_section :admin

  def index
    @resource = Resource.unapproved.first
  end

  def approve
    @resource = Resource.find(params[:id])

    if @resource && @resource.approve!(current_user)
      redirect_to(admin_resources_path, :notice => "Resource was approved successfully.")
    else
      redirect_to(admin_resources_path, :notice => "Resource approval failed.")
    end
  end

  def delete
    @resource = Resource.find(params[:id])

    @resource.destroy
    redirect_to(admin_resources_path, :notice => "Resource was deleted successfully.")
  end

  def check_can_approve
    current_user.is_admin? || current_user.can_approve_resources?
  end
end
