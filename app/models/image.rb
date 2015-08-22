class Image < ActiveRecord::Base
  belongs_to :project_item

  mount_uploader :item_photo, ImageUploader
end
