class Category < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true

  has_many :resources

  scope :visible, where(:hidden => false)
end
