module ProfilesHelper
  def show_badges(badges)
    render :partial => "badge", :collection => badges
  end
end
