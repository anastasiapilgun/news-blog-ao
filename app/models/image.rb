class Image < ApplicationRecord
  mount_uploader :source, ImageUploader
  belongs_to :post
end
