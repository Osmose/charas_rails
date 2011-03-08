module ApplicationHelper

    def button_tag(*args, &block)
        content_tag(:button, *args, &block)
    end

    def main_box(title, bclass = false, &block)
        render(:layout => "shared/block", :locals => {:title => title, :bclass => bclass}, &block)
    end

    def small_box(title, bclass = false, &block)
        render(:layout => "shared/small_block", :locals => {:title => title, :bclass => bclass}, &block)
    end
    
    def submit_button(text)
        content_tag(:button, :type => :submit, :class => "button") do
            text
        end
    end

    def nav_tab(text, path, section)
      render(:partial => "layouts/nav_tab", :locals => {:text => text, :path => path, :section => section})
    end

    def form_grouped_select(object, method, collection, group_method,
        group_label_method, option_key_method, option_value_method,
        options = {}, html_options = {})

      render(:partial => "shared/formtastic_li", :locals => {
        :label => object.to_s.humanize,
        :li_id => object.to_s + "_input",
        :li_class => "select",
        :label_for => object.to_s + method.to_s,
        :content => grouped_collection_select(object, method, collection,
          group_method, group_label_method, option_key_method, option_value_method,
          options, html_options)
        })
    end

    def resource_list(title, resources, paginate = false)
      render :partial => "shared/resources/resource_list", :locals => {:title => title, :resources => resources, :paginate => paginate}
    end

    def show_resource(resource)
      if resource.type == :image
        image_tag(resource.res.url)
      elsif resource.type == :audio
        link_to(resource.res_file_name, resource.res.url, :class => "embedMedia")
      end
    end
end
