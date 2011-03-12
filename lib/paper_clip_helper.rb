module PaperClipHelper
  module ClassMethods
    def has_attached_file_s3(name, options = {})
      has_attached_file name, options.merge({
        :storage        => :s3,
        :bucket         => ENV['S3_BUCKET'],
        :s3_credentials => {
          :access_key_id     => ENV['S3_KEY'],
          :secret_access_key => ENV['S3_SECRET']
        }
      })
    end
  end

  def self.included(receiver)
    receiver.extend(ClassMethods)
  end
end
