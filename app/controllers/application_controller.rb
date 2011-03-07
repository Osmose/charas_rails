class ApplicationController < ActionController::Base
  protect_from_forgery
  @@section = nil

  def self.current_section(section)
    @@section = section
  end

  def current_section?(section)
    @@section == section
  end

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
