class Category < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true

  belongs_to :parent, :class_name => "Category"
  has_many :children, :class_name => "Category", :foreign_key => "parent_id"

  has_many :resources

  scope :visible, where(:hidden => false)
  scope :roots, where(:parent_id => nil)
  scope :leafs, where("id NOT IN (SELECT parent_id FROM categories WHERE parent_id IS NOT NULL)")
  scope :sorted_alphabetically, order("name ASC")

  def is_parent?
    children.length > 0
  end

  def is_child?
    !parent.nil?
  end
end
