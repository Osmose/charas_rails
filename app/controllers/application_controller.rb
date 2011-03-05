class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def check_admin
    current_user.is_admin?
  end
  
  def sub_layout
    if devise_controller?
        "box"
    else
        "mainSidebar"
    end
  end
end
