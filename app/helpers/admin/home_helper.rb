module Admin::HomeHelper
  def admin_link_section(title, &block)
    render :partial => "admin/link_section", :locals => {:title => title, :links => capture(&block)}
  end
end
