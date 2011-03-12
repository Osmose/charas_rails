module ResourcesHelper
  def favorite_button(resource)
    render :partial => "favorite_button", :locals => {:resource => resource}
  end

  def category_breadcrumb(category)
    link = link_to(category.name, resource_category_path(category.id))
    if category.is_child?
      link = category_breadcrumb(category.parent) + " > " + link
    end

    link
  end

  def resource_list(title, resources, paginate = false)
    render :partial => "shared/resources/resource_list", :locals => {:title => title, :resources => resources, :paginate => paginate}
  end

  def show_resource(resource)
    if resource.type == :image
      image_tag(resource.res.url, :class => "zoom")
    elsif resource.type == :audio
      link_to(resource.res_file_name, resource.res.url, :class => "embedMedia")
    end
  end
end
