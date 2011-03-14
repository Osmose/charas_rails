class NewsItem < ActiveRecord::Base
  validates :title, :presence => true, 
                    :length => {:minimum => 5, :maximum => 200}
  validates :content, :presence => true,
                      :length => {:minimum => 10}
  validates :user_id, :presence => true

  belongs_to :user

  scope :recent, order("created_at DESC").limit(3)
end
