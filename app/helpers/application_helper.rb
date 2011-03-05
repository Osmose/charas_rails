module ApplicationHelper

    def button_tag(*args, &block)
        content_tag(:button, *args, &block)
    end

    def main_box(title, &block)
        render(:layout => "shared/block", :locals => {:title => title}, &block)
    end
    
end
