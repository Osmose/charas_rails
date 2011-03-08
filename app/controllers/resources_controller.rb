class ResourcesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show, :search, :download]
  before_filter :build_sidebar_categories, :only => [:index, :show, :search, :category]
  before_filter :init_search_object, :only => [:index, :search]
  current_section :complete_resources

  def index
    @popular_resources = Resource.find_by_rank
  end
    
  def search
    @resources = Resource.search_query(@search).paginate(
      :page => params[:page],
      :order => "created_at DESC"
    )
  end

  def category
    @category = Category.find(params[:id])

    if @category
      @resources = @category.resources.paginate(
        :page => params[:page],
        :order => "created_at DESC"
      )
    else
      redirect_to :back, :error => "Category not found"
    end
  end

  def favorite
    ResourceFavorite.favorite_resource(current_user.id, params[:id])

    redirect_to :back
  end

  def unfavorite
    ResourceFavorite.unfavorite_resource(current_user.id, params[:id])

    redirect_to :back
  end
    
  def show
    @resource = Resource.find(params[:id])
        
    if !@resource
      redirect_to(resources_path, :error => "Resource not found")
    end
  end
    
  def download
    # TODO: Check referer on download
    @resource = Resource.find(params[:id])
        
    if @resource
        
    else
        
    end
  end
    
  def new
    @resource = Resource.new
  end
    
  def edit
    @resource = Resource.find(params[:id])
  end
    
  def create
    @resource = Resource.new(params[:resource])
    @resource.user = current_user

    if @resource.save
      redirect_to(@resource, :notice => 'Resource was successfully created.')
    else
      render :action => "new"
    end
  end
    
  def update
    @resource = Resource.find(params[:id])

    if @resource.update_attributes(params[:resource])
      redirect_to(@resource, :notice => 'Resource was successfully updated.')
    else
      render :action => "edit"
    end
  end
    
  def destroy
    @resource = Resource.find(params[:id])
        
    @resource.destroy
    redirect_to(posts_url, :notice => "Resource was deleted successfully")
  end
    
  def sub_layout
    if ["new", "edit", "update", "create"].include?(action_name)
      "box"
    else
      "mainSidebar"
    end
  end

  def build_sidebar_categories
    @sidebar_categories = Category.visible
  end

  def init_search_object
    @search = ResourceSearch.new
    @search.attributes = params[:resource_search]
  end
end
