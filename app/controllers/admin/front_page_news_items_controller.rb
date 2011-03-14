class Admin::FrontPageNewsItemsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_news_editor
  current_section :admin

  def index
    @news_items = FrontPageNewsItem.paginate(
      :page => params[:page],
      :order => "created_at DESC"
    )
  end

  def show
    @news_item = FrontPageNewsItem.find(params[:id])

    if !@news_item
      redirect_to(admin_newsitems_path, :alert => "News item not found.")
    end
  end

  def new
    @news_item = FrontPageNewsItem.new
  end

  def edit
    @news_item = FrontPageNewsItem.find(params[:id])
  end

  def create
    @news_item = FrontPageNewsItem.new(params[:front_page_news_item])
    @news_item.user = current_user

    if @news_item.save
      redirect_to(admin_front_page_news_items_path, :notice => 'News item was successfully created.')
    else
      render :action => "new", :alert => "Error saving News item."
    end
  end

  def update
    @news_item = FrontPageNewsItem.find(params[:id])

    if @news_item.update_attributes(params[:news_item])
      redirect_to(admin_news_items_path, :notice => 'News item was successfully updated.')
    else
      render :action => "edit", :alert => "Error editing news item."
    end
  end

  def destroy
    @news_item = FrontPageNewsItem.find(params[:id])

    @news_item.destroy
    redirect_to(admin_newsitems_path, :notice => "News item was deleted successfully.")
  end

  def sub_layout
    if ["new", "edit", "update", "create"].include?(action_name)
      "box"
    else
      "mainSidebar"
    end
  end

  def check_news_editor
    current_user.is_news_editor?
  end
end
