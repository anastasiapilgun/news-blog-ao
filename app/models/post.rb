class Post < ApplicationRecord
  has_one :image
  has_many :comments
  scope :published, -> { where(published: true) }
end
