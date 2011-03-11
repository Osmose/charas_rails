class ResourceReviewAchievement50 < Achievement
  cattr_reader :num, :img, :desc

  @@num = 50
  @@img = "icons/med/page_white_magnify_silver.png"
  @@desc = "This user has done their part for Charas and reviewed 50 submissions to the Complete Resources."
end
