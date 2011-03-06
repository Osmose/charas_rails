module ApplicationHelper

    def button_tag(*args, &block)
        content_tag(:button, *args, &block)
    end

    def main_box(title, bclass = false, &block)
        render(:layout => "shared/block", :locals => {:title => title, :bclass => bclass}, &block)
    end
    
    def submit_button(text)
        content_tag(:button, :type => :submit, :class => "button") do
            text
        end
    end
    
end
