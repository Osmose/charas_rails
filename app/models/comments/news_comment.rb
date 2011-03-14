class NewsComment < Comment
  validates :parent_id, :presence => true

  belongs_to :news_item, :class_name => "FrontPageNewsItem", :foreign_key => "parent_id"
end