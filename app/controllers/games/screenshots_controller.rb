class Games::ScreenshotsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  current_section :games

  def index
    @new_screenshot = Screenshot.new
    @game = Game.find(params[:id])
    @screenshots = Screenshot.for_game(params[:id]).paginate(
      :page => params[:page],
      :order => "created_at DESC"
    )
  end

  def show
    @screenshot = Screenshot.find(params[:id])
    @next_screenshot = @screenshot.next
    @prev_screenshot = @screenshot.previous
  end

  def create
    @screenshot = Screenshot.new(params[:screenshot])
    @screenshot.game_id = params[:id]

    if @screenshot.save
      redirect_to(games_screenshots_show_path(@screenshot), :notice => 'Screenshot was successfully created.')
    else
      redirect_to :back, :error => "Error saving screenshot."
    end
  end

  def destroy
    @screenshot = Screenshot.find(params[:id])

    @screenshot.destroy
    redirect_to(games_screenshots_path, :notice => "Screenshot was deleted successfully")
  end
end
