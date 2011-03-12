module ApplicationHelper
  include FormHelper
  include TemplateHelper

  def add_hover(text, &block)
    render(:partial => "shared/hover_container", :locals => {:hoverText => text, :content => capture(&block)})
  end
end
