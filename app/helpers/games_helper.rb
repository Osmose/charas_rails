module GamesHelper
  def game_navigation(game)
    render :partial => "games/sidebar", :locals => {:game => game}
  end
end
