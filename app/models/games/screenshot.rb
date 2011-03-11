class Screenshot < ActiveRecord::Base
  include PaperClipHelper

  has_attached_file_s3 :img, :styles => { :small => "150x113#" }
end
