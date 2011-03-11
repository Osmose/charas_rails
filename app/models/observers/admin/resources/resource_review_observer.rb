class ResourceReviewObserver < ActiveRecord::Observer
  observe :resource

  def after_update(resource)
    if (resource.approved_by_changed? && resource.approved?)
      user = resource.reviewer

      check_review_count(ResourceReviewAchievement10, user)
      check_review_count(ResourceReviewAchievement50, user)
      check_review_count(ResourceReviewAchievement100, user)
    end
  end

  def check_review_count(achievement, user)
    if !user.awarded?(achievement) && user.approved_resources.size >= achievement.num
      user.award(achievement)
      user.save
    end
  end
end
