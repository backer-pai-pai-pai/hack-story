class Image < ActiveRecord::Base
  belongs_to :project_item

  validates :item_photo, presence: true

  mount_uploader :item_photo, ImageUploader
end
