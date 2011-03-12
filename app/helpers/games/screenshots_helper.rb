module Games::ScreenshotsHelper
  include GamesHelper

  def screenshot_list(screenshots)
    render :partial => "screenshot_list_item", :collection => screenshots
  end
end
