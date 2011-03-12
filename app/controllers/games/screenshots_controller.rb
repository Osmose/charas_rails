class Games::ScreenshotsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :check_developer_screenshot, :only => [:logo, :destroy]
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

  def logo
    screenshot = Screenshot.find(params[:id])
    
    # This line is kind've silly
    if screenshot.game.update_attributes(:screenshot => screenshot)
      notice = "Screenshot was made logo successfully."
    else
      notice = "Error making screenshot logo."
    end

    redirect_to(games_screenshots_show_path(screenshot), :notice => notice)
  end

  def create
    # Check if allowed to create screenshot
    game = Game.find(params[:id])
    if (game.nil? || !game.is_developer?(current_user))
      return redirect_to(games_screenshots_path(game), :alert => "Action not authorized.")
    end

    screenshot = Screenshot.new(params[:screenshot])
    screenshot.game_id = params[:id]

    if screenshot.save
      redirect_to(games_screenshots_show_path(screenshot), :notice => 'Screenshot was successfully created.')
    else
      redirect_to :back, :error => "Error saving screenshot."
    end
  end

  def destroy
    screenshot = Screenshot.find(params[:id])

    # Check if allowed to destroy
    if !screenshot.game.is_developer?(current_user)
      redirect_to(games_screenshots_path(screenshot.game), :alert => "Action not authorized.")
    end

    screenshot.destroy
    redirect_to(games_screenshots_path(game), :notice => "Screenshot was deleted successfully")
  end

  def check_developer_screenshot
    game = Screenshot.find(params[:id]).game
    game.nil? || !game.is_developer?(current_user)
  end
end
