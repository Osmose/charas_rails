class ResourceReviewAchievement10 < Achievement
  cattr_reader :num, :img, :desc

  @@num = 10
  @@img = "icons/med/page_white_magnify.png"
  @@desc = "This user has helped out Charas and reviewed 10 submissions to the Complete Resources."
end
