class FrontPageNewsItem < NewsItem
  has_many :comments, :class_name => "NewsComment", :foreign_key => "parent_id"
end
