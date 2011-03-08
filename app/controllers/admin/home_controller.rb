class Admin::HomeController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_allowed_in_admin
  current_section :admin

  def index
    
  end

  def check_allowed_in_admin
    current_user.can_see_admin_tab?
  end
end
