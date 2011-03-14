class Group < ActiveRecord::Base
  Head_Admin_ID = 1
  Admin_ID = 2
  Resource_Approval_ID = 3
  News_Editor_ID = 4

  validates :real_id, :uniqueness => true, :allow_nil => true

  has_many :group_memberships
  has_many :users, :through => :group_memberships
end
