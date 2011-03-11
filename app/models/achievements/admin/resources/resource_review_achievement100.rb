class ResourceReviewAchievement100 < Achievement
  cattr_reader :num, :img, :desc

  @@num = 100
  @@img = "icons/med/page_white_magnify_gold.png"
  @@desc = "This user is part of what makes Charas tick; they've reviewed 100 submissions to the Complete Resources!"
end
