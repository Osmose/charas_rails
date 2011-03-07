class ResourceFavorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :resource

  def self.is_favorite?(user_id, resource_id)
    !ResourceFavorite.where(:user_id => user_id, :resource_id => resource_id).first.nil?
  end

  def self.favorite_resource(user_id, resource_id)
    res = ResourceFavorite.new
    res.user_id = user_id
    res.resource_id = resource_id
    res.save
  end

  def self.unfavorite_resource(user_id, resource_id)
    res = ResourceFavorite.where(:user_id => user_id, :resource_id => resource_id).first
    if res
      res.destroy
    end
  end
end
