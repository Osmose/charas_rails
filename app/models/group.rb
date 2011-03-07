class Group < ActiveRecord::Base
  Head_Admin_ID = 1
  Admin_ID = 2

  has_many :group_memberships
  has_many :users, :through => :group_memberships

  def is_admin_group?
    real_id == Head_Admin_ID || real_id == Admin_ID
  end

  def is_head_admin_group?
    real_id ==  Head_Admin_ID
  end
end
