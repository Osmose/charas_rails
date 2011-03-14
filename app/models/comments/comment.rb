class Comment < ActiveRecord::Base
  validates :title, :presence => true,
                    :length => {:minimum => 5, :maximum => 200}
  validates :content, :presence => true,
                      :length => {:minimum => 1}
  validates :user_id, :presence => true

  belongs_to :user
end
