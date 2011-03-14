module GamesHelper
  def game_info(game)
    render :partial => "games/game_info", :locals => {:game => game}
  end

  def game_navigation(game)
    render :partial => "games/sidebar", :locals => {:game => game}
  end
end
