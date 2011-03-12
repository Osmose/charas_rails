class GamesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]  
  current_section :games

  def index
    @games = Game.paginate(
      :page => params[:page],
      :order => "created_at DESC"
    )
  end
  
  def show
    @game = Game.find(params[:id])
      
    if !@game      
      redirect_to(games_path, :error => "Game not found")
    end
  end
  
  def new
    @game = Game.new
  end
  
  def edit
    @game = Game.find(params[:id])
  end
  
  def create
    @game = Game.new(params[:game])
    @game.user = current_user

    if @game.save
      redirect_to(@game, :notice => 'Game was successfully created.')
    else
      redirect_to :back, :error => "Error saving game."
    end
  end
  
  def update
    @game = Game.find(params[:id])

    if @game.update_attributes(params[:game])
      redirect_to(@game, :notice => 'Game was successfully updated.')
    else
      render :action => "edit", :error => "Error editing game"
    end
  end
  
  def destroy
    @game = Game.find(params[:id])
      
    @game.destroy
    redirect_to(posts_url, :notice => "Game was deleted successfully")
  end
  
  def sub_layout
    if ["new", "edit", "update", "create"].include?(action_name)
      "box"
    else
      "mainSidebar"
    end
  end
end
