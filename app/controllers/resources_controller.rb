class ResourcesController < ApplicationController
    before_filter :authenticate_user!, :except => [:index, :show, :download]
    
    def index
        @resources = Resource.paginate(
            :page => params[:page],
            :order => "created_at DESC"
        )
        
        respond_to do |format|
            format.html
            format.xml {render :xml => @resources}
        end
    end
    
    def show
        @resource = Resource.find(params[:id])
        
        if @resource
            respond_to do |format|
              format.html # show.html.erb
              format.xml  { render :xml => @resource }
            end
        else
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
            redirect_to :back, :error => "Error saving resource."
        end
    end
    
    def update
        @resource = Resource.find(params[:id])

        if @resource.update_attributes(params[:resource])
            redirect_to(@resource, :notice => 'Resource was successfully updated.')
        else
            render :action => "edit", :error => "Error editing resource"
        end
    end
    
    def destroy
        @resource = Resource.find(params[:id])
        
        @resource.destroy
        redirect_to(posts_url, :notice => "Resource was deleted successfully")
    end
    
    def sub_layout
        if controller.action_name == "new" || controller.action_name == "edit"
            "box"
        else
            "mainSidebar"
        end
    end
end
