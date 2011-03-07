class Admin::CategoriesController < ApplicationController
    before_filter :authenticate_user!
    before_filter :check_admin
    current_section :admin

    def index
        @categories = Category.paginate(
            :page => params[:page],
            :order => "name DESC"
        )
        
        respond_to do |format|
            format.html
            format.xml {render :xml => @categories}
        end
    end
    
    def show
        @category = Category.find(params[:id])
        
        if @category
            respond_to do |format|
              format.html # show.html.erb
              format.xml  { render :xml => @category }
            end
        else
            redirect_to(admin_categories_path, :error => "Category not found")
        end
    end
    
    def new
        @category = Category.new
    end
    
    def edit
        @category = Category.find(params[:id])
    end
    
    def create
        @category = Category.new(params[:category])

        if @category.save
            redirect_to(admin_categories_path, :notice => 'Category was successfully created.')
        else
             render :action => "new", :error => "Error saving category."
        end
    end
    
    def update
        @category = Category.find(params[:id])

        if @category.update_attributes(params[:category])
            redirect_to(admin_categories_path, :notice => 'Category was successfully updated.')
        else
            render :action => "edit", :error => "Error editing category"
        end
    end
    
    def destroy
        @category = Category.find(params[:id])
        
        @category.destroy
        redirect_to(posts_url, :notice => "Category was deleted successfully")
    end
    
    def sub_layout
        if ["new", "edit", "update", "create"].include?(action_name)
            "box"
        else
            "mainSidebar"
        end
    end
end
