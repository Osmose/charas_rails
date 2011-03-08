class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :group_ids
  
  has_many :resources
  has_many :games
  has_many :group_memberships, :dependent => :destroy
  has_many :groups, :through => :group_memberships
  has_many :resource_favorites
  has_many :favorites, :source => :resource, :through => :resource_favorites

  cattr_reader :per_page
  @@per_page = 10

  def is_admin?
    in_group(Group::Admin_ID) || in_group(Group::Head_Admin_ID)
  end

  def is_head_admin?
    in_group(Group::Head_Admin_ID)
  end

  def can_approve_resources?
    is_admin? || in_group(Group::Resource_Approval_ID)
  end

  def can_see_admin_tab?
    is_admin? || can_approve_resources?
  end

  protected

  def in_group(id)
    groups.each do |g|
      if g.real_id == id
        return true
      end
    end

    return false
  end

end
