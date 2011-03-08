# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Category.create(:name => "Screenshots", :hidden => true)

# Head Admins can can do anything
head_admins = Group.create :name => "Head Administrators",
             :real_id => Group::Head_Admin_ID,
             :description => "Developers or heads of the site."

# Admins can do anything but take away admin from others
admins = Group.create :name => "Administrators",
             :real_id => Group::Admin_ID,
             :description => "Administrators for the entire site."

# CR Approvers can approve resources in the CR
reviewers = Group.create :name => "Complete Resource Reviewers",
             :real_id => Group::Resource_Approval_ID,
             :description => "Users that can approve or delete resources submitted to the CR."

u = User.create(:name => "Admin", :email => "a@b.com", :password => "asdfdf", :password_confirmation => "asdfdf")
u.groups << head_admins