module ResourcesHelper
  def resource_list(title, resources, paginate = false)
    render :partial => "resource_list", :locals => {:title => title, :resources => resources, :paginate => paginate}
  end

  def favorite_button(resource)
    render :partial => "favorite_button", :locals => {:resource => resource}
  end
end
