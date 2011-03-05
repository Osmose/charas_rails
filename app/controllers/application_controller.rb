class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def sub_layout
    if devise_controller?
        "box"
    else
        "mainSidebar"
    end
  end
end
