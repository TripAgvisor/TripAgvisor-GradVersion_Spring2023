class PostAttachment < ActiveRecord::Base
   mount_uploader :images, ImagesUploader
   belongs_to :user
   belongs_to :experience
end