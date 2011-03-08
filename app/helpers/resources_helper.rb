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
end
