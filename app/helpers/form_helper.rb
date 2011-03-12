module FormHelper
  def button_tag(*args, &block)
    content_tag(:button, *args, &block)
  end

  def submit_button(text)
    content_tag(:button, :type => :submit, :class => "button") do
      text
    end
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
end
