class NewsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new_comment, :update_comment, :destroy_comment]
  before_filter :can_modify_comment, :only => [:update_comment, :destroy_comment]
  current_section :news

  def index
    @recent_news = FrontPageNewsItem.recent
  end

  def show
    @news_item = FrontPageNewsItem.find(params[:id])
    @comments = @news_item.comments.order("created_at DESC")
    @new_comment = NewsComment.new
    @new_comment.title = "RE: " + @news_item.title
  end

  def new_comment
    news_item = FrontPageNewsItem.find(params[:id])
    comment = news_item.comments.build(params[:news_comment])
    comment.user = current_user

    if comment.save
      redirect_to news_path(news_item), :notice => "Comment created successfully."
    else
      redirect_to :back, :alert => "Failed saving comment:" + comment.errors.full_messages.to_sentence
    end
  end

  def update_comment
    comment = NewsComment.find(params[:id])

    if comment.update_attributes(params)
      redirect_to news_path(comment.news_item), :notice => "Comment updated successfully."
    else
      redirect_to :back, :alert => "Failed updating comment."
    end
  end

  def destroy_comment
    comment = NewsComment.find(params[:id])
    news_item = comment.news_item

    comment.destroy
    redirect_to news_path(news_item), :notice => "Comment deleted."
  end

  def can_modify_comment
    # TODO: Move into model
    comment = NewsComment.find(params[:id])

    current_user.is_admin? || comment.user == current_user
  end
end
