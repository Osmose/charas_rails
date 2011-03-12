module TemplateHelper
  def nav_tab(text, path, section)
    render(:partial => "layouts/nav_tab", :locals => {:text => text, :path => path, :section => section})
  end

  def main_box(title, bclass = false, &block)
    render(:partial => "shared/block", :locals => {:title => title, :bclass => bclass, :content => capture(&block)})
  end

  def small_box(title, bclass = false, &block)
    render(:partial => "shared/small_block", :locals => {:title => title, :bclass => bclass, :content => capture(&block)})
  end

  def sidebar_box(title, bclass = false, &block)
    render(:partial => "shared/sidebar_block", :locals => {:title => title, :bclass => bclass, :content => capture(&block)})
  end

  def sidebar_list(title, bclass = false, &block)
    render(:partial => "shared/sidebar_list", :locals => {:title => title, :bclass => bclass, :content => capture(&block)})
  end

  def list_item(label, item = nil, &block)
    render(:partial => "shared/list_item", :locals => {:label => label, :item => (item or capture(&block))})
  end

  def button_link(label, link, extra_class = "")
    link_to(label.html_safe, link, :class => "button " + extra_class)
  end
end
