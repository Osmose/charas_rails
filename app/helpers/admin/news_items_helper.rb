module Admin::NewsItemsHelper
  include ::ApplicationHelper
  include ::NewsHelper

  def action_links(news_item)
    link_to("edit", edit_admin_front_page_news_item_path(news_item)) + " | " +
      link_to("delete", admin_front_page_news_items_path(news_item), :method => :delete)
  end
end
