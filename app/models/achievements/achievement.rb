class Achievement < ActiveRecord::Base
  validates :type, :presence => true, :uniqueness => {:scope => :user_id}
  validates :user_id, :presence => true

  belongs_to :user
end
