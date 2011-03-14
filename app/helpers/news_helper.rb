module NewsHelper
  def news_items(items)
    render :partial => "shared/news/news_item", :collection => items
  end

  def news_item(item)
    render :partial => "shared/news/news_item", :object => item
  end

  def item_meta_info(item)
    (
      "Posted by " +
      link_to(item.user.name, user_profile_path(item.user)) +
      " at " + format_time(item.created_at)
    ).html_safe
  end

  def comment_form(new_comment)
    render :partial => "shared/news/comment_form", :locals => {:new_comment => new_comment}
  end

  def show_comment(comment)
    render :partial => "shared/news/comment", :object => comment
  end

  def show_comments(comments)
    render :partial => "shared/news/comment", :collection => comments
  end
end
