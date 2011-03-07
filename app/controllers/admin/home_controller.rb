class Admin::HomeController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_admin
  current_section :admin

  def index
    
  end
end
